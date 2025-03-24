import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:meal_tracker/core/utils/app_assets.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/features/onboarding/data/models/on_boarding_model.dart';
import 'package:meal_tracker/features/onboarding/logic/on_barding_service.dart';

import '../../app/injector.dart';

class AppConstant {
  const AppConstant._();
  static const AppConstant _instance = AppConstant._();
  factory AppConstant() => _instance;

  static const int defaultPaddingValue = 16;

  static const mealBox = 'meal_box';
  static const mealDatabase = 'meal_db';

  static List<OnBoardingModel> onBoardingItems(
          BuildContext context, LiquidController liquidController) =>
      [
        OnBoardingModel(
          imagePath: AppSvgAssets.onboarding1,
          bgColor: context.scaffoldBackgroundColor,
          title: 'Track',
          subTitle: 'Your Daily Meals 🍽️',
          details:
              "📊 Log your breakfast, lunch, dinner, and snacks to stay on top of your nutrition.",
          buttonColor: context.primaryColor,
          buttonTextColor: context.whiteColor,
          buttonText: 'Next',
          onPress: () {
            liquidController.animateToPage(page: 1, duration: 300);
          },
        ),
        OnBoardingModel(
          imagePath: AppSvgAssets.onboarding2,
          bgColor: context.primaryColor,
          title: 'Set',
          subTitle: 'Personalized Goals 🎯',
          details:
              "🥗 Define your calorie and macro goals to achieve a healthier lifestyle.",
          buttonColor: context.whiteColor,
          buttonTextColor: context.blackColor,
          buttonText: 'Next',
          onPress: () {
            liquidController.animateToPage(page: 2, duration: 300);
          },
        ),
        OnBoardingModel(
          imagePath: AppSvgAssets.onboarding3,
          bgColor: const Color(0xffE71B5E),
          title: 'Analyze',
          subTitle: 'Your Progress 📈',
          details:
              "📅 Review daily and weekly reports to understand your eating habits and make better choices.",
          buttonColor: context.whiteColor,
          buttonTextColor: context.blackColor,
          buttonText: 'Get Started',
          onPress: () async {
            await serviceLocator<OnBardingService>().navigateToHome(context);
          },
        ),
      ];
}
