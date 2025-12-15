import 'package:campus_lost_found/core/domain/app_user.dart';

class UserRepository {
  AppUser? _currentUser;

  AppUser getCurrentUser() {
    return _currentUser ?? const AppUser(
      id: 'user-1',
      name: 'Demo User',
      role: UserRole.student,
      studentNumber: 'STU-2023-001',
    );
  }

  void setCurrentUser(AppUser user) {
    _currentUser = user;
  }

  void updateUserRole(UserRole role) {
    final current = getCurrentUser();
    _currentUser = current.copyWith(role: role);
  }
}

