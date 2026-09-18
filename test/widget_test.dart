// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fit_app_frontend/config/app_config.dart';
import 'package:fit_app_frontend/config/app_config_provider.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fit_app_frontend/main.dart';

void main() {
  testWidgets('app supports the configured locale without localization warnings',
      (WidgetTester tester) async {
    final config = await AppConfig.load();
    await tester.pumpWidget(AppConfigProvider(config: config, child: MyApp()));

    expect(tester.takeException(), isNull,
        reason: 'The app should support its configured locale and delegates.');
  });
}
