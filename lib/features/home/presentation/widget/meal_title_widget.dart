import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';

class MealTitleWidget extends StatelessWidget {
  const MealTitleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Text(
        'Your Meals',
        style: getBoldStyle(
          color: context.defaultTextColor,
          fontSize: 16.sp,
        ),
      ),
    );
  }
}
