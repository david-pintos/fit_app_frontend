
import 'package:flutter/material.dart';

Color parseColor(String colorString) {
  if (colorString.startsWith('#')) {
    colorString = colorString.substring(1);
  }
  if (colorString.length == 6) {
    colorString = 'FF$colorString'; // Add alpha value if not provided
  }
  return Color(int.parse(colorString, radix: 16));
}

Locale parseLocale(String localeString) {
  final parts = localeString.split('_');
  if (parts.length == 2) {
    return Locale(parts[0], parts[1]);
  } else {
    return Locale(parts[0]);
  }
}

List<Locale> parseSupportedLocales(List<String> localeStrings) {
  return localeStrings.map((localeString) {
    return parseLocale(localeString);
  }).toList();
}