import 'package:fit_app_frontend/auth/models/auth_controller.dart';
import 'package:fit_app_frontend/config/app_config.dart';
import 'package:fit_app_frontend/config/app_localization.dart';
import 'package:fit_app_frontend/ui/login/page_models/login.dart';
import 'package:fit_app_frontend/utils/utils.dart';
import 'package:fit_app_frontend/ui/calendar/page_models/calendar.dart';
import 'package:fit_app_frontend/ui/layout.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load application configuration
  final config = await AppConfig.load();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthController()),
        Provider<AppConfig>.value(value: config),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Main application widget
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: context.appConfig.appName,
      locale: AppLocalization.locale(context.appConfig),
      supportedLocales: AppLocalization.supportedLocales(context.appConfig),
      localizationsDelegates: AppLocalization.delegates,
      theme: ThemeData(
        // Application theme based on the primary color from the configuration
        colorScheme: ColorScheme.fromSeed(seedColor: parseColor(context.appConfig.primaryColor)),
      ),
      initialRoute: '/signin', // Set the default route to the login screen
      // Define application routes for navigation
      routes: {
        '/home': (context) => TabsLayout(
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
        '/signin': (context) => const LoginScreen(),
      }
    );
  }
}