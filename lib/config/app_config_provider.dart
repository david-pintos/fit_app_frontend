import 'package:flutter/material.dart';
import 'package:fit_app_frontend/config/app_config.dart';

// class AppConfigProvider: An InheritedWidget that provides access to the AppConfig
// throughout the application context.
//    @config: The AppConfig instance to be provided
//    @child: The child widget that will have access to the AppConfig
//
//    This class will be used to provide access to the application configuration
//    throughout the widget tree, allowing widgets to access the configuration
//    without needing to pass it down through constructors. It will be used in
//    conjunction with the AppConfig class to provide consistent theming, localization,
//    and branding throughout the application.
class AppConfigProvider extends InheritedWidget {
  final AppConfig config;

  const AppConfigProvider({
    super.key,
    required this.config,
    required super.child,
  });

  static AppConfig of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<AppConfigProvider>();

    assert(provider != null, 'No AppConfigProvider found in context');

    return provider!.config;
  }

  @override
  bool updateShouldNotify(AppConfigProvider oldWidget) {
    return config != oldWidget.config;
  }
}

// Extension on BuildContext to easily access the AppConfig from anywhere in the widget tree.
extension AppConfigExtension on BuildContext {
  AppConfig get appConfig => AppConfigProvider.of(this);
}