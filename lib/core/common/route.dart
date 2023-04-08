import 'package:akbarrm_mobileapps/features/main/presentation/page/main_screen.dart';
import 'package:akbarrm_mobileapps/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Map<String, WidgetBuilder> routeNames(BuildContext context) {
    return {
      SplashScreen.routeName: (context) => const SplashScreen(),
      MainScreen.routeName: (context) => MainScreen(),
    };
  }
}
