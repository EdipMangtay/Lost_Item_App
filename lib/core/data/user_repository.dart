import 'package:campus_lost_found/core/domain/app_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Firestore-backed repository for the current application user.
///
/// This is the single place that knows how to read/write `users/{uid}` docs.
class UserRepository {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  UserRepository({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _usersCollection =>
      _firestore.collection('users');

  /// Stream of the current logged-in [AppUser], backed by `users/{uid}`.
  ///
  /// Yields `null` when the user is signed out or the document does not exist.
  Stream<AppUser?> currentUserStream() async* {
    await for (final firebaseUser in _auth.userChanges()) {
      if (firebaseUser == null) {
        yield null;
        continue;
      }

      final docRef = _usersCollection.doc(firebaseUser.uid);
      await for (final snapshot in docRef.snapshots()) {
        if (!snapshot.exists) {
          yield null;
          continue;
        }

        final data = snapshot.data() ?? <String, dynamic>{};
        yield _mapUser(firebaseUser, data);
      }
    }
  }

  /// One-shot fetch of the current [AppUser], or `null` if signed out.
  Future<AppUser?> getCurrentUserOnce() async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) return null;

    final doc = await _usersCollection.doc(firebaseUser.uid).get();
    if (!doc.exists) return null;

    return _mapUser(firebaseUser, doc.data() ?? <String, dynamic>{});
  }

  /// Ensure there is a `users/{uid}` document for the given [firebaseUser].
  ///
  /// If the document does not exist, it is created with sensible defaults.
  /// If it exists, the name/studentNo are updated when provided.
  Future<void> ensureUserDocExists(
    User firebaseUser, {
    String? name,
    String? studentNo,
  }) async {
    final docRef = _usersCollection.doc(firebaseUser.uid);
    final snapshot = await docRef.get();

    final now = FieldValue.serverTimestamp();

    if (!snapshot.exists) {
      await docRef.set({
        'uid': firebaseUser.uid,
        'name': name ?? firebaseUser.displayName ?? (firebaseUser.email ?? ''),
        'email': firebaseUser.email,
        // Default role: STUDENT. Officers/admins can be promoted via console.
        'role': 'STUDENT',
        'studentNo': studentNo,
        'photoUrl': firebaseUser.photoURL,
        'createdAt': now,
        'updatedAt': now,
      });
      return;
    }

    // Merge minimal profile updates.
    final updateData = <String, dynamic>{
      'updatedAt': now,
    };
    if (name != null && name.isNotEmpty) {
      updateData['name'] = name;
    }
    if (studentNo != null) {
      updateData['studentNo'] = studentNo;
    }

    if (updateData.length > 1) {
      await docRef.update(updateData);
    }
  }

  /// Update the current user's profile fields for the Settings page.
  Future<void> updateProfile({
    required String name,
    String? studentNo,
  }) async {
    final firebaseUser = _auth.currentUser;
    if (firebaseUser == null) {
      throw StateError('No authenticated user');
    }

    final docRef = _usersCollection.doc(firebaseUser.uid);
    final now = FieldValue.serverTimestamp();

    await docRef.set(
      {
        'name': name,
        'studentNo': studentNo,
        'updatedAt': now,
      },
      SetOptions(merge: true),
    );
  }

  AppUser _mapUser(User firebaseUser, Map<String, dynamic> data) {
    final roleString = (data['role'] as String? ?? 'STUDENT').toUpperCase();
    final UserRole role;
    switch (roleString) {
      case 'OFFICER':
        role = UserRole.officer;
        break;
      case 'ADMIN':
        role = UserRole.admin;
        break;
      default:
        role = UserRole.student;
    }

    final createdAtRaw = data['createdAt'];
    final updatedAtRaw = data['updatedAt'];

    DateTime? createdAt;
    DateTime? updatedAt;

    if (createdAtRaw is Timestamp) {
      createdAt = createdAtRaw.toDate();
    }
    if (updatedAtRaw is Timestamp) {
      updatedAt = updatedAtRaw.toDate();
    }

    return AppUser(
      uid: firebaseUser.uid,
      name: (data['name'] as String?) ??
          firebaseUser.displayName ??
          (firebaseUser.email ?? 'User'),
      role: role,
      studentNo: data['studentNo'] as String?,
      photoUrl: data['photoUrl'] as String?,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}


