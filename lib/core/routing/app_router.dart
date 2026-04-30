import 'package:fit_flow/core/di/dependency_injection.dart';
import 'package:fit_flow/core/routing/routes.dart';
import 'package:fit_flow/features/home/logic/home_cubit.dart';
import 'package:fit_flow/features/home/ui/home_screen.dart';
import 'package:fit_flow/features/onboarding/ui/onboarding_screen.dart';
import 'package:fit_flow/features/splash/ui/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(builder: (context) => const SplashScreen());
      case Routes.onboarding:
        return MaterialPageRoute(
          builder: (context) => const OnboardingScreen(),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<HomeCubit>()..fetchWorkoutPlan(),
            child: const HomeScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              const Scaffold(body: Center(child: Text('404'))),
        );
    }
  }
}
