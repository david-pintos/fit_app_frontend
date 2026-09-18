import 'package:flutter/services.dart';
import 'package:yaml/yaml.dart';

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
