import 'package:fit_app_frontend/config/app_config.dart';
import 'package:fit_app_frontend/config/app_config_provider.dart';
import 'package:fit_app_frontend/src/utils.dart';
import 'package:fit_app_frontend/layouts/calendar/calendar.dart';
import 'package:fit_app_frontend/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load application configuration
  final config = await AppConfig.load();
  runApp(AppConfigProvider(config: config, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Main application widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.appConfig.appName,
      locale: parseLocale(context.appConfig.defaultLocale),
      supportedLocales: parseSupportedLocales(context.appConfig.supportedLocales),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      theme: ThemeData(
        // Application theme based on the primary color from the configuration
        colorScheme: ColorScheme.fromSeed(seedColor: parseColor(context.appConfig.primaryColor)),
      ),
      home: TabsLayout(
        title: context.appConfig.appName,

        // Main application layout based on tabs
        tabs: const <Tab>[
          Tab(icon: Icon(Icons.calendar_today), text: 'Calendar'),
          Tab(icon: Icon(Icons.fitness_center), text: 'Activities'),
          Tab(icon: Icon(Icons.settings), text: 'Settings'),
        ],
        tabViews: <Widget>[
          CalendarPage(),
          Center(child: Text('Fitness')),
          Center(child: Text('Settings')),
        ],
      ),
    );
  }
}