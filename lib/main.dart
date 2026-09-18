import 'package:fit_app_frontend/config/app_config.dart';
import 'package:fit_app_frontend/config/app_config_provider.dart';
import 'package:fit_app_frontend/src/utils.dart';
import 'package:fit_app_frontend/layouts/calendar.dart';
import 'package:fit_app_frontend/layouts/layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final config = await AppConfig.load();
  runApp(AppConfigProvider(config: config, child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: parseColor(context.appConfig.primaryColor)),
      ),
      home: TabsLayout(
        title: context.appConfig.appName,
        
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