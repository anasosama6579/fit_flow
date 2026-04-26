import 'package:fit_flow/core/routing/routes.dart';
import 'package:fit_flow/features/onboarding/ui/onboarding_screen.dart';
import 'package:fit_flow/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(builder: (context) => const OnboardingScreen(),);
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold(body: Center(child: Text('404'))));
    }
  }
}