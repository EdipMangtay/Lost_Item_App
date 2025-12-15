import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_user.freezed.dart';
part 'app_user.g.dart';

/// High-level role for the user, derived from Firestore `users/{uid}.role`.
///
/// Firestore stores this as an uppercased string: STUDENT | OFFICER | ADMIN.
enum UserRole {
  student,
  officer,
  admin,
}

@freezed
class AppUser with _$AppUser {
  const factory AppUser({
    /// Firebase Auth UID
    required String uid,

    /// Display name shown in the UI
    required String name,

    /// App-level role (student/officer/admin)
    required UserRole role,

    /// Optional student number, e.g. "STU-2023-001"
    String? studentNo,

    /// Optional photo URL for avatar
    String? photoUrl,

    /// Creation timestamp from Firestore
    DateTime? createdAt,

    /// Last profile update timestamp from Firestore
    DateTime? updatedAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) =>
      _$AppUserFromJson(json);
}


