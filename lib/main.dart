import 'package:akbarrm_mobileapps/core/common/route.dart';
import 'package:akbarrm_mobileapps/di/di_object.dart';
import 'package:akbarrm_mobileapps/features/splash/splash_screen.dart';
import 'package:alice/alice.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final alice = Alice(
  showNotification: true,
  navigatorKey: navigatorKey,
);

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppLocator.initAlice(alice);
  AppLocator.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple POS',
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: SplashScreen.routeName,
      routes: AppRoute.routeNames(context),
    );
  }
}
