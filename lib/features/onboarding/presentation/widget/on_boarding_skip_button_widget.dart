import 'package:flutter/material.dart';
import 'package:meal_tracker/app/injector.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';
import 'package:meal_tracker/features/onboarding/logic/on_barding_service.dart';

class OnBoardingSkipButtonWidget extends StatefulWidget {
  const OnBoardingSkipButtonWidget({super.key});
  @override
  State<OnBoardingSkipButtonWidget> createState() =>
      _OnBoardingSkipButtonWidgetState();
}

class _OnBoardingSkipButtonWidgetState
    extends State<OnBoardingSkipButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () async {
        return await serviceLocator<OnBardingService>().navigateToHome(context);
      },
      child: Text(
        'Skip',
        style: getMediumStyle(color: context.defaultTextColor),
      ),
    );
  }
}
