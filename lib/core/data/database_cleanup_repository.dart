import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

/// Repository for cleaning up database data (for presentation/demo purposes).
/// 
/// This will delete all found_items, claims, chats, and photos,
/// but keeps users collection intact so the app doesn't break.
class DatabaseCleanupRepository {
  final FirebaseFirestore _firestore;
  final FirebaseStorage _storage;

  DatabaseCleanupRepository({
    FirebaseFirestore? firestore,
    FirebaseStorage? storage,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _storage = storage ?? FirebaseStorage.instanceFor(
          app: Firebase.app(),
          bucket: 'campus-lost-found-83347.firebasestorage.app',
        );

  /// Clear all application data except users.
  /// 
  /// This deletes:
  /// - found_items collection (and photos subcollections)
  /// - claims collection
  /// - chats collection (and messages subcollections)
  /// - All photos from Firebase Storage
  /// 
  /// Users collection is preserved to keep the app functional.
  Future<void> clearAllData() async {
    try {
      debugPrint('[DatabaseCleanup] Starting database cleanup...');

      // 1. Delete all found_items and their photos
      await _deleteFoundItems();

      // 2. Delete all claims
      await _deleteClaims();

      // 3. Delete all chats and messages
      await _deleteChats();

      // 4. Delete all photos from Storage
      await _deleteAllStoragePhotos();

      debugPrint('[DatabaseCleanup] Database cleanup completed successfully');
    } catch (e, stackTrace) {
      debugPrint('[DatabaseCleanup] Error during cleanup: $e');
      debugPrint('[DatabaseCleanup] Stacktrace: $stackTrace');
      rethrow;
    }
  }

  Future<void> _deleteFoundItems() async {
    final itemsSnapshot = await _firestore.collection('found_items').get();
    debugPrint('[DatabaseCleanup] Found ${itemsSnapshot.docs.length} items to delete');

    for (final itemDoc in itemsSnapshot.docs) {
      // Delete photos subcollection
      final photosSnapshot = await itemDoc.reference.collection('photos').get();
      for (final photoDoc in photosSnapshot.docs) {
        await photoDoc.reference.delete();
      }

      // Delete the item document
      await itemDoc.reference.delete();
    }

    debugPrint('[DatabaseCleanup] Deleted all found_items');
  }

  Future<void> _deleteClaims() async {
    final claimsSnapshot = await _firestore.collection('claims').get();
    debugPrint('[DatabaseCleanup] Found ${claimsSnapshot.docs.length} claims to delete');

    for (final claimDoc in claimsSnapshot.docs) {
      await claimDoc.reference.delete();
    }

    debugPrint('[DatabaseCleanup] Deleted all claims');
  }

  Future<void> _deleteChats() async {
    final chatsSnapshot = await _firestore.collection('chats').get();
    debugPrint('[DatabaseCleanup] Found ${chatsSnapshot.docs.length} chats to delete');

    for (final chatDoc in chatsSnapshot.docs) {
      // Delete messages subcollection
      final messagesSnapshot = await chatDoc.reference.collection('messages').get();
      for (final messageDoc in messagesSnapshot.docs) {
        await messageDoc.reference.delete();
      }

      // Delete the chat document
      await chatDoc.reference.delete();
    }

    debugPrint('[DatabaseCleanup] Deleted all chats');
  }

  Future<void> _deleteAllStoragePhotos() async {
    try {
      final foundItemsRef = _storage.ref().child('found_items');
      final listResult = await foundItemsRef.listAll();

      for (final itemFolder in listResult.prefixes) {
        final foundFolder = itemFolder.child('found');
        try {
          final photosList = await foundFolder.listAll();
          for (final photoRef in photosList.items) {
            try {
              await photoRef.delete();
              debugPrint('[DatabaseCleanup] Deleted storage photo: ${photoRef.fullPath}');
            } catch (e) {
              debugPrint('[DatabaseCleanup] Warning: Failed to delete ${photoRef.fullPath}: $e');
            }
          }
        } catch (e) {
          debugPrint('[DatabaseCleanup] Warning: Failed to list photos in ${foundFolder.fullPath}: $e');
        }
      }

      debugPrint('[DatabaseCleanup] Deleted all storage photos');
    } catch (e) {
      debugPrint('[DatabaseCleanup] Warning: Error deleting storage photos: $e');
      // Don't throw - storage cleanup is best effort
    }
  }
}



