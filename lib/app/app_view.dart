import 'package:flutter/material.dart';

import '../services/dependency_injection.dart';
import '../utils/app_constants/app_context.dart';
import '../utils/app_routes/app_routes.dart';
import '../utils/app_theme/app_theme_data.dart';

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalContext.navigatorKey,
      theme: appLightThemeData,
      themeMode: ThemeMode.light,
      darkTheme: appDarkThemeData,
      routes: getIt<AppRoutes>().routes,
    );
  }
}
