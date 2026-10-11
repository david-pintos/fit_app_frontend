import 'package:fit_app_frontend/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:fit_app_frontend/config/app_config.dart';

// class AppLocalization: Handles localization for the application based on
// the configuration provided in AppConfig.
// This class doesn't provide any translation strings itself but rather
// sets up the supported locales and delegates for localization.
class AppLocalization {
  const AppLocalization._();

  static Locale locale(AppConfig config) {
    return parseLocale(config.defaultLocale);
  }

  static List<Locale> supportedLocales(AppConfig config) {
    return parseSupportedLocales(config.supportedLocales);
  }

  static const List<LocalizationsDelegate<dynamic>> delegates = [
    GlobalMaterialLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ];
}