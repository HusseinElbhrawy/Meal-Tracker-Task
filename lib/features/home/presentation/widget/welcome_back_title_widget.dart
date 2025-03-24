import 'package:flutter/material.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';

class WelcomeBackTitleWidget extends StatelessWidget {
  const WelcomeBackTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "Welcome",
        style: getRegularStyle(
          color: context.defaultTextColor,
        ).copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "Let's get some item!",
        style: getMediumStyle(
          color: context.defaultTextColor,
          fontSize: 16,
        ),
      ),
    );
  }
}
