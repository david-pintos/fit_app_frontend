
import 'package:fit_app_frontend/auth/models/auth_controller.dart';
import 'package:fit_app_frontend/auth/models/roles_permissions.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// class PermissionBuilder: A widget that conditionally displays its child based on the user's permissions.
//  @permission: The permission required to display the child widget.
//  @child: The widget to display if the user has the required permission.
//  @fallback: An optional widget to display if the user does not have the required permission
//    (defaults to an empty SizedBox if not provided).
class PermissionBuilder extends StatelessWidget {
  final Permission permission;
  final Widget child;
  final Widget? fallback;

  const PermissionBuilder({
    super.key,
    required this.permission,
    required this.child,
    this.fallback = const SizedBox.shrink(),
  });

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthController>(context, listen: true);

    if (auth.currentUser != null && auth.currentUser!.hasPermission(permission)) {
      return child;
    } else {
      return fallback ?? const SizedBox.shrink();
    }
  }
}