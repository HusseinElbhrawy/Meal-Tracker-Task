import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracker/app/injector.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:meal_tracker/features/home/logic/add_new_meal/add_new_meal_cubit.dart';
import 'package:meal_tracker/features/home/logic/edit_meal/edit_meal_cubit.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';
import 'package:meal_tracker/features/home/presentation/screens/edit/edit_meal_screen.dart';
import 'package:meal_tracker/features/home/presentation/screens/home/home_screen.dart';
import 'package:meal_tracker/features/home/presentation/screens/new-meal/add_new_meal_screen.dart';

import '../../core/utils/app_strings.dart';
import '../../features/onboarding/presentation/screens/on_boarding_screen.dart';
import '../../features/splash/presentation/screens/splash_screen.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String onboardingRoute = '/onboarding';
  static const String homeRoute = '/home';
  static const String addNewMealRoute = '/add-new-meal';
  static const String editMealRoute = '/edit-meal';
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
      case Routes.homeRoute:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<HomeCubit>(),
            child: const HomeScreen(),
          ),
          settings: routeSettings,
        );
      case Routes.addNewMealRoute:
        return CupertinoPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<AddNewMealCubit>(),
            child: const AddNewMealScreen(),
          ),
          settings: routeSettings,
        );
      case Routes.editMealRoute:
        return CupertinoPageRoute(
          builder: (_) {
            var item = routeSettings.arguments;

            return BlocProvider(
              create: (context) => serviceLocator<EditMealCubit>(),
              child: EditMealScreen(item: item as MealModel),
            );
          },
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
