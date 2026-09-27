import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

// class AppConfig: Represents the application configuration loaded from a YAML file
//    @appName: The name of the application
//    @description: A brief description of the application
//    @primaryColor: The primary color of the application, used for theming
//    @logoPath: The path to the application's logo image
//    @supportedLocales: A list of supported locales for localization
//    @defaultLocale: The default locale for the application
//
//    This class will be used to load and store the application configuration
//    from a YAML file, and will be accessed throughout the application to
//    provide consistent theming, localization, and branding.
class AppConfig {
  final String appName;
  final String description;
  final String primaryColor;
  final String logoPath;
  final List<String> supportedLocales;
  final String defaultLocale;

  AppConfig({
    required this.appName,
    required this.description,
    required this.primaryColor,
    required this.logoPath,
    required this.supportedLocales,
    required this.defaultLocale,
  });

  static Future<AppConfig> load() async {
    final yamlString = await rootBundle.loadString('config/config.yaml');

    final yamlMap = loadYaml(yamlString);

    return AppConfig(
      appName: yamlMap['app']['name'] as String,
      description: yamlMap['app']['description'] as String,
      primaryColor: yamlMap['branding']['primary_color'] as String,
      logoPath: yamlMap['branding']['logo_path'] as String,
      supportedLocales: List<String>.from(yamlMap['localization']['supported_locales'] as List),
      defaultLocale: yamlMap['localization']['default_locale'] as String,
    );
  }
}
