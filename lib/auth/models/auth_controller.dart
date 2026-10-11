
import 'package:fit_app_frontend/auth/models/roles_permissions.dart';
import 'package:fit_app_frontend/auth/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

// A mock list of users for demonstration purposes. In a real application,
// this data would come from a backend service.
final users = List<User>.unmodifiable([
  User(
    id: '1',
    username: 'test',
    email: 'test@example.com',
    role: UserRole.user,
    permissions: {
      Permission.activityView,
      Permission.activityBook,
      Permission.activityUnbook,
    },
  ),
  User(
    id: '2',
    username: 'admin',
    email: 'admin@example.com',
    role: UserRole.admin,
    permissions: {
      Permission.activityCreate,
      Permission.activityView,
      Permission.activityUpdate,
      Permission.activityDelete,
      Permission.userCreate,
      Permission.userView,
      Permission.userUpdate,
      Permission.userDelete,
    },
  ),
]);

// class AuthController: Manages user authentication and authorization.
//  @currentUser: The currently authenticated user, if any.
//  @isAuthenticated: A boolean indicating whether a user is currently authenticated.
class AuthController extends ChangeNotifier {
  User? _currentUser;
  bool _isAuthenticated = false;

  User? get currentUser => _currentUser;
  bool get isAuthenticated => _isAuthenticated;

  // function hasPermission: Checks if the currently authenticated user has a specific permission.
  //  @permission: The permission to check for.
  bool hasPermission(Permission permission) {
    return _currentUser?.hasPermission(permission) ?? false;
  }

  // function authUser: Authenticates a user based on the provided login data.
  //  @data: The login data containing the username and password.
  //
  //  Returns a Future that resolves to a string error message if authentication fails,
  //  or null if authentication is successful.
  Future<String?> authUser(LoginData data) {
    return Future.delayed(const Duration(milliseconds: 300)).then((_) {
      User? user;

      try {
        user = users.firstWhere((user) => user.username == data.name);
      } catch (_) {
        return 'Username not exists';
      }

      // TODO: In a real application, it would verify the password against a secure backend service.
      if (user.username != data.password) {
        return 'Password does not match';
      }

      login(user);
      return null;
    });
  }

  // function recoverPassword: Implements the password recovery logic.
  //  @name: The username for which to recover the password.
  //
  //  Returns a Future that resolves to a string error message if the username does not exist,
  //  or null if the username exists (indicating that password recovery can proceed).
  //
  //  TODO: In a real application, this would typically involve sending a password reset email
  //  or providing a secure way for the user to reset their password.
  Future<String?> recoverPassword(String name) {
    return Future.delayed(const Duration(seconds: 1)).then((_) {
      try {
        users.firstWhere((user) => user.username == name);
      } catch (_) {
        return 'Username not exists';
      }

      return null;
    });
  }

  void login(User user) {
    _isAuthenticated = true;
    _currentUser = user;
    notifyListeners();
  }

  void logout() {
    _isAuthenticated = false;
    _currentUser = null;
    notifyListeners();
  }
}