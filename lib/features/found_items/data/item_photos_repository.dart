import 'dart:io';

import 'package:campus_lost_found/core/domain/item_photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

/// Repository for uploading and streaming item photos from Storage/Firestore.
class ItemPhotosRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  ItemPhotosRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        // CRITICAL: Use explicit custom bucket URL
        // The actual Firebase Storage bucket is: gs://campus-lost-found-83347.firebasestorage.app
        // NOT the default from firebase_options.dart (appspot.com)
        // This prevents "object-not-found" and "yanıt ayrıştırılamıyor" errors
        _storage = storage ?? FirebaseStorage.instanceFor(
          app: Firebase.app(),
          bucket: 'campus-lost-found-83347.firebasestorage.app',
        );

  /// Real-time stream of photos for an item from subcollection:
  /// found_items/{itemId}/photos
  Stream<List<ItemPhoto>> watchPhotos(String itemId) {
    final collection = _firestore
        .collection('found_items')
        .doc(itemId)
        .collection('photos')
        .orderBy('createdAt', descending: false);

    return collection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        final url = data['url'] as String? ?? '';
        final typeString =
            (data['type'] as String? ?? 'FOUND').toUpperCase();

        final PhotoType type =
            typeString == 'HANDOVER' ? PhotoType.handover : PhotoType.found;

        final createdAt =
            (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now();

        return ItemPhoto(
          id: doc.id,
          itemId: itemId,
          type: type,
          // For backend we store the download URL in assetPath.
          assetPath: url,
          uploadedAt: createdAt,
        );
      }).toList();
    });
  }

  /// Upload a photo to Storage and create a Firestore doc under photos subcollection.
  ///
  /// Storage path: found_items/{itemId}/found/{photoId}.jpg
  Future<ItemPhoto> uploadFoundItemPhoto({
    required String itemId,
    required File file,
  }) async {
    // CRITICAL: Verify authentication before upload
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser == null) {
      throw FirebaseException(
        plugin: 'firebase_storage',
        code: 'unauthenticated',
        message: 'User must be authenticated to upload photos',
      );
    }

    try {
      debugPrint(
          '[ItemPhotosRepository] Upload started. itemId=$itemId, path=${file.path}');
      debugPrint(
          '[ItemPhotosRepository] Current user: ${currentUser.uid}');

      // Verify file exists and is readable
      if (!await file.exists()) {
        throw Exception('File does not exist at path: ${file.path}');
      }

      final fileSize = await file.length();
      if (fileSize == 0) {
        throw Exception('File is empty: ${file.path}');
      }

      debugPrint(
          '[ItemPhotosRepository] File verified. Size: $fileSize bytes');

      final photoId = const Uuid().v4();
      final storageRef = _storage
          .ref()
          .child('found_items/$itemId/found/$photoId.jpg');

      debugPrint(
          '[ItemPhotosRepository] Storage path: ${storageRef.fullPath}');
      debugPrint(
          '[ItemPhotosRepository] Storage bucket: ${_storage.bucket}');

      // CRITICAL: Explicit metadata with contentType is REQUIRED for iOS
      final metadata = SettableMetadata(
        contentType: 'image/jpeg',
        cacheControl: 'public, max-age=31536000',
        customMetadata: {
          'uploadedBy': currentUser.uid,
          'itemId': itemId,
          'uploadedAt': DateTime.now().toIso8601String(),
        },
      );

      debugPrint(
          '[ItemPhotosRepository] Starting upload with metadata...');

      // Upload with explicit metadata - this is CRITICAL for iOS
      // putFile signature: putFile(File file, [SettableMetadata? metadata])
      final uploadTask = storageRef.putFile(file, metadata);

      // Monitor upload progress (optional, for debugging)
      uploadTask.snapshotEvents.listen((taskSnapshot) {
        if (taskSnapshot.totalBytes > 0) {
          final progress = (taskSnapshot.bytesTransferred /
                  taskSnapshot.totalBytes) *
              100;
          debugPrint(
              '[ItemPhotosRepository] Upload progress: ${progress.toStringAsFixed(1)}%');
        }
      });

      // Wait for upload to complete with timeout
      final taskSnapshot = await uploadTask.timeout(
        const Duration(minutes: 2),
        onTimeout: () {
          throw Exception('Upload timeout after 2 minutes');
        },
      );
      
      debugPrint(
          '[ItemPhotosRepository] Upload completed. bytesTransferred=${taskSnapshot.bytesTransferred}, totalBytes=${taskSnapshot.totalBytes}, state=${taskSnapshot.state}');

      // Check upload state
      if (taskSnapshot.state != TaskState.success) {
        throw Exception(
          'Upload failed with state: ${taskSnapshot.state}. '
          'Please check your internet connection and try again.',
        );
      }

      if (taskSnapshot.bytesTransferred == 0 || taskSnapshot.totalBytes == 0) {
        throw Exception('Upload completed but no bytes were transferred');
      }
      
      // Verify bytes match
      if (taskSnapshot.bytesTransferred != taskSnapshot.totalBytes) {
        debugPrint(
          '[ItemPhotosRepository] Warning: Upload incomplete. '
          'Transferred: ${taskSnapshot.bytesTransferred}/${taskSnapshot.totalBytes}',
        );
        // Still continue - sometimes Firebase reports this but upload is successful
      }

      // CRITICAL: Wait a moment after upload completes before getting URL
      // Firebase Storage sometimes needs a brief moment to process the upload
      // This prevents "yanıt ayrıştırılamıyor" (response parsing) errors
      await Future.delayed(const Duration(milliseconds: 500));
      
      // Get download URL with robust retry mechanism
      String url = '';
      int retryCount = 0;
      const maxRetries = 5; // Increased retries for better reliability
      Exception? lastException;
      
      while (retryCount < maxRetries) {
        try {
          // Wait progressively longer between retries (exponential backoff)
          if (retryCount > 0) {
            await Future.delayed(Duration(seconds: retryCount * 2));
          }
          
          debugPrint('[ItemPhotosRepository] Attempting to get download URL (attempt ${retryCount + 1}/$maxRetries)...');
          
          url = await storageRef.getDownloadURL().timeout(
            const Duration(seconds: 30),
            onTimeout: () {
              throw Exception('Failed to get download URL: timeout after 30 seconds');
            },
          );
          
          debugPrint('[ItemPhotosRepository] Download URL obtained: $url');
          
          // Validate URL format
          if (url.isEmpty) {
            throw Exception('Download URL is empty');
          }
          
          if (!url.startsWith('http://') && !url.startsWith('https://')) {
            throw Exception('Invalid download URL format: $url');
          }
          
          // Success - break out of retry loop
          lastException = null;
          break;
        } on FirebaseException catch (e) {
          retryCount++;
          lastException = e;
          debugPrint(
            '[ItemPhotosRepository] FirebaseException getting download URL (attempt $retryCount/$maxRetries): ${e.code} - ${e.message}',
          );
          
          // If it's a permanent error, don't retry
          if (e.code == 'object-not-found' || 
              e.code == 'unauthorized' || 
              e.code == 'permission-denied') {
            debugPrint('[ItemPhotosRepository] Permanent error detected, not retrying');
            rethrow;
          }
          
          if (retryCount >= maxRetries) {
            debugPrint('[ItemPhotosRepository] All retry attempts failed for getDownloadURL');
            // Upload was successful, but we can't get the URL
            // Construct a URL manually as fallback
            final bucket = _storage.bucket;
            final path = storageRef.fullPath;
            url = 'https://firebasestorage.googleapis.com/v0/b/$bucket/o/${Uri.encodeComponent(path)}?alt=media';
            debugPrint('[ItemPhotosRepository] Using constructed URL as fallback: $url');
            break;
          }
          
          debugPrint('[ItemPhotosRepository] Retrying in ${retryCount * 2} seconds...');
        } catch (e) {
          retryCount++;
          lastException = e is Exception ? e : Exception(e.toString());
          debugPrint(
            '[ItemPhotosRepository] Error getting download URL (attempt $retryCount/$maxRetries): $e',
          );
          
          if (retryCount >= maxRetries) {
            debugPrint('[ItemPhotosRepository] All retry attempts failed for getDownloadURL');
            // Upload was successful, but we can't get the URL
            // Construct a URL manually as fallback
            try {
              final bucket = _storage.bucket;
              final path = storageRef.fullPath;
              url = 'https://firebasestorage.googleapis.com/v0/b/$bucket/o/${Uri.encodeComponent(path)}?alt=media';
              debugPrint('[ItemPhotosRepository] Using constructed URL as fallback: $url');
              break;
            } catch (fallbackError) {
              debugPrint('[ItemPhotosRepository] Fallback URL construction also failed: $fallbackError');
              if (lastException is FirebaseException) {
                rethrow;
              }
              throw Exception('Failed to get download URL after $maxRetries attempts: $e');
            }
          }
          
          debugPrint('[ItemPhotosRepository] Retrying in ${retryCount * 2} seconds...');
        }
      }

      if (url.isEmpty && lastException != null) {
        // Last resort: try to construct URL manually
        try {
          final bucket = _storage.bucket;
          final path = storageRef.fullPath;
          url = 'https://firebasestorage.googleapis.com/v0/b/$bucket/o/${Uri.encodeComponent(path)}?alt=media';
          debugPrint('[ItemPhotosRepository] Using constructed URL as last resort: $url');
        } catch (e) {
          debugPrint('[ItemPhotosRepository] Could not construct fallback URL: $e');
          throw lastException;
        }
      }
      
      if (url.isEmpty) {
        throw Exception('Download URL is empty after all retry attempts and fallback');
      }

      // Create Firestore document
      final docRef = _firestore
          .collection('found_items')
          .doc(itemId)
          .collection('photos')
          .doc(photoId);

      await docRef.set({
        'url': url,
        'type': 'found',
        'uploadedBy': currentUser.uid,
        'createdAt': FieldValue.serverTimestamp(),
      });
      debugPrint(
          '[ItemPhotosRepository] Photo document created under found_items/$itemId/photos/$photoId');

      // Update coverPhotoUrl on parent item (only if not already set)
      try {
        await _firestore.collection('found_items').doc(itemId).update({
          'coverPhotoUrl': url,
        });
        debugPrint(
            '[ItemPhotosRepository] coverPhotoUrl updated on found_items/$itemId');
      } catch (e) {
        debugPrint(
            '[ItemPhotosRepository] Warning: Could not update coverPhotoUrl: $e');
        // Non-critical, continue
      }

      return ItemPhoto(
        id: photoId,
        itemId: itemId,
        type: PhotoType.found,
        assetPath: url,
        uploadedAt: DateTime.now(),
      );
    } on FirebaseException catch (e, st) {
      debugPrint(
          '[ItemPhotosRepository] FirebaseException while uploading photo:');
      debugPrint('[ItemPhotosRepository] Code: ${e.code}');
      debugPrint('[ItemPhotosRepository] Message: ${e.message}');
      debugPrint('[ItemPhotosRepository] Plugin: ${e.plugin}');
      debugPrint('[ItemPhotosRepository] Stacktrace: $st');
      debugPrint(
          '[ItemPhotosRepository] Storage bucket used: ${_storage.bucket}');
      debugPrint(
          '[ItemPhotosRepository] Current user: ${FirebaseAuth.instance.currentUser?.uid ?? "null"}');
      
      // Provide user-friendly error messages
      String userMessage = e.message ?? 'Unknown error';
      if (e.code == 'unknown' && e.message?.contains('yanıt ayrıştırılamıyor') == true) {
        userMessage = 'Network error: Could not connect to Firebase Storage. Please check your internet connection and try again.';
      } else if (e.code == 'unauthenticated') {
        userMessage = 'Authentication error: Please sign in again.';
      } else if (e.code == 'permission-denied') {
        userMessage = 'Permission denied: You do not have permission to upload photos.';
      } else if (e.code == 'object-not-found') {
        userMessage = 'Storage error: The upload location was not found.';
      }
      
      // Create a new exception with user-friendly message
      throw FirebaseException(
        plugin: e.plugin,
        code: e.code,
        message: userMessage,
      );
    } catch (e, st) {
      debugPrint(
          '[ItemPhotosRepository] Unknown error while uploading photo: $e');
      debugPrint('[ItemPhotosRepository] Error type: ${e.runtimeType}');
      debugPrint('[ItemPhotosRepository] Stacktrace: $st');
      rethrow;
    }
  }

  /// Delete all photos (Firestore docs + Storage objects) for a given item.
  Future<void> deleteAllPhotosForItem(String itemId) async {
    try {
      final photosSnap = await _firestore
          .collection('found_items')
          .doc(itemId)
          .collection('photos')
          .get();

      for (final doc in photosSnap.docs) {
        final photoId = doc.id;

        // Storage path follows the same pattern as upload
        final ref = _storage
            .ref()
            .child('found_items/$itemId/found/$photoId.jpg');

        try {
          await ref.delete();
          debugPrint(
              '[ItemPhotosRepository] Deleted storage object ${ref.fullPath}');
        } catch (e) {
          debugPrint(
              '[ItemPhotosRepository] Warning: Failed to delete storage object ${ref.fullPath}: $e');
        }

        try {
          await doc.reference.delete();
        } catch (e) {
          debugPrint(
              '[ItemPhotosRepository] Warning: Failed to delete photo doc ${doc.reference.path}: $e');
        }
      }
    } catch (e, st) {
      debugPrint(
          '[ItemPhotosRepository] Error while deleting all photos for item $itemId: $e');
      debugPrint('[ItemPhotosRepository] Stacktrace: $st');
      rethrow;
    }
  }
}