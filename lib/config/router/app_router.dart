import 'package:clean_arc/features/home/presentation/pages/home_page.dart';
import 'package:clean_arc/features/splash/splash_page.dart';
import 'package:flutter/material.dart';

import 'routes_name.dart';

class AppRouter {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashPage(),
        );
      case RoutesName.home:
        return MaterialPageRoute(
          builder: (context) => const HomePage(),
        );
      default:
        return onUnknownRoute(settings);
    }
  }

  static Route<dynamic> onUnknownRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text(
              'No route defined for ${settings.name}',
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
    );
  }
}
