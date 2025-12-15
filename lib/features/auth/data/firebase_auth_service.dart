import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:campus_lost_found/core/data/user_repository.dart';
import 'package:campus_lost_found/core/domain/app_user.dart';

/// Firebase Auth + Firestore backend for email/password authentication.
class FirebaseAuthService {
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final UserRepository _userRepository;

  FirebaseAuthService({
    FirebaseAuth? auth,
    FirebaseFirestore? firestore,
    UserRepository? userRepository,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _firestore = firestore ?? FirebaseFirestore.instance,
        _userRepository = userRepository ??
            UserRepository(
              auth: auth,
              firestore: firestore,
            );

  /// Register a user with email & password and ensure users/{uid} doc exists.
  ///
  /// Default role is STUDENT; officers/admins can be promoted via console.
  Future<UserCredential> registerWithEmail({
    required String name,
    required String email,
    required String password,
    String? studentNo,
  }) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user;
    if (user == null) {
      throw StateError('Failed to create user');
    }

    await _userRepository.ensureUserDocExists(
      user,
      name: name,
      studentNo: studentNo,
    );

    return cred;
  }

  /// Email/password sign-in.
  Future<UserCredential> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = cred.user;
    if (user != null) {
      // Make sure profile doc exists / is up to date.
      await _userRepository.ensureUserDocExists(user);
    }

    return cred;
  }

  Future<void> signOut() => _auth.signOut();

  /// Stream of [AppUser] for router & Settings integration.
  ///
  /// This delegates to [UserRepository.currentUserStream] so it stays in sync
  /// with the Firestore `users/{uid}` document.
  Stream<AppUser?> authStateChanges() {
    return _userRepository.currentUserStream();
  }
}

