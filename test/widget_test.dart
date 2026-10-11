// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fit_app_frontend/config/app_localization.dart';
import 'package:fit_app_frontend/config/app_config.dart';


void main() {
  test('configured locale is included in supported locales', () async {
    final config = await AppConfig.load();

    final locale = AppLocalization.locale(config);
    final supportedLocales =
        AppLocalization.supportedLocales(config);

    expect(
      supportedLocales,
      contains(locale),
      reason: 'The configured locale must be supported by the app.',
    );
  });

  testWidgets(
    'localization delegates resolve without warnings',
    (WidgetTester tester) async {
      final config = await AppConfig.load();

      await tester.pumpWidget(
        MaterialApp(
          locale: AppLocalization.locale(config),
          supportedLocales:
              AppLocalization.supportedLocales(config),
          localizationsDelegates: AppLocalization.delegates,
          home: const Scaffold(
            body: Text('Localization test'),
          ),
        ),
      );

      expect(
        tester.takeException(),
        isNull,
        reason: 'Localization should resolve without framework exceptions.',
      );
    },
  );
}
