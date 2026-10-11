import 'package:fit_app_frontend/auth/models/roles_permissions.dart';

// class User: Represents a user in the application.
//  @id: Unique identifier for the user.
//  @username: The username of the user.
//  @email: The email address of the user.
//  @role: The role of the user, which determines their access level.
//  @permissions: A set of permissions assigned to the user, which can be used to
//    determine what actions they can perform in the application.
//
// The hasPermission method checks if the user has a specific permission.
class User {
  final String id;
  final String username;
  final String email;
  final UserRole role;
  final Set<Permission> permissions;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.role,
    required this.permissions,
  });

  bool hasPermission(Permission permission) {
    return permissions.contains(permission);
  }
}