import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/utils/app_strings.dart';
import '../../features/onboarding/presentation/screens/on_boarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String homeRoute = '/home';
}

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashRoute:
        return CupertinoPageRoute(
          builder: (_) => const SplashScreen(),
          settings: routeSettings,
        );
      case Routes.onboardingRoute:
        return CupertinoPageRoute(
          builder: (_) => const OnBoardingScreen(),
          settings: routeSettings,
        );

      //! Default
      default:
        return _unDefinedRoute();
    }
  }

  static MaterialPageRoute<dynamic> _unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(
            AppStrings.noRouteFound,
          ),
        ),
        body: const Center(
          child: Text(
            AppStrings.noRouteFound,
          ),
        ),
      ),
    );
  }
}
