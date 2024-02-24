import 'package:flutter/material.dart';
import '../../view/screens/app_nav_bar/app_nav_bar_screen.dart';
import '../../view/screens/home/home_screen.dart';

class AppRoutes {
  final Map<String, Widget Function(BuildContext)> routes = {
    '/': (_) => const AppNavBarScreen(),
   
    AppNavBarScreen.routeName: (_) => const AppNavBarScreen(),
    HomeScreen.routeName: (_) => const HomeScreen(),
  
  };
}
