import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fit_app_frontend/auth/models/auth_controller.dart';
import 'package:fit_app_frontend/config/app_config.dart';
import 'package:flutter_login/flutter_login.dart';

// class LoginScreen: Provides a login interface for users to authenticate themselves.
//
//  This widget uses the `flutter_login` package to create a login form.
//  It interacts with the `AuthController` to handle authentication and password recovery logic.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  // function _loginMessages: Returns LoginMessages object with strings for various UI elements in the login form.
  LoginMessages _loginMessages(BuildContext context) {
    return LoginMessages(
        userHint: 'User',
        passwordHint: 'Password',
        confirmPasswordHint: 'Confirm',
        loginButton: 'LOG IN',
        signupButton: 'REGISTER',
        forgotPasswordButton: 'Forgot your password?',
        recoverPasswordButton: 'HELP ME',
        goBackButton: 'GO BACK',
        confirmPasswordError: 'Not match!',
        recoverPasswordDescription:
            'We will send your password to the email address.',
        recoverPasswordSuccess: 'Password rescued successfully',
      );
  }

  // function _loginTheme: Returns a LoginTheme object that defines the visual styling of the login form.
  LoginTheme _loginTheme(BuildContext context) {
    return LoginTheme(
      primaryColor: Theme.of(context).colorScheme.surface,
      accentColor: Theme.of(context).colorScheme.secondary,
      errorColor: Theme.of(context).colorScheme.error,
      logoWidth: 1,
      buttonTheme: LoginButtonTheme(
        backgroundColor: Theme.of(context).colorScheme.primary,
        highlightColor: Theme.of(context).colorScheme.primaryContainer,
        splashColor: Theme.of(context).colorScheme.onPrimary,
        elevation: 9.0,
        highlightElevation: 6.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      titleStyle: TextStyle(
        color: Theme.of(context).colorScheme.onPrimary,
        fontFamily: 'Quicksand',
        letterSpacing: 4,
      ),
      cardTheme: CardTheme(
        color: Theme.of(context).colorScheme.secondaryContainer,
        elevation: 5,
        margin: const EdgeInsets.only(top: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      onLogin: context.read<AuthController>().authUser,
      logo: AssetImage(context.appConfig.logoPath),
      userType: LoginUserType.name,
      userValidator: (value) {
        if (value == null || value.isEmpty) {
          return 'Username is required';
        }
        return null;
      },
      onSubmitAnimationCompleted: () {
        // Navigate to the main application screen after successful login/signup
        Navigator.of(context).pushReplacementNamed('/home');
      },
      onRecoverPassword: context.read<AuthController>().recoverPassword,
      messages: _loginMessages(context),
      theme: _loginTheme(context),
    );
  }
}