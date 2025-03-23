import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/features/onboarding/data/models/on_boarding_model.dart';

import '../../../../core/utils/style_manager.dart';

class OnBoardingItemWidget extends StatelessWidget {
  const OnBoardingItemWidget({
    super.key,
    required this.item,
    required this.currentIndex,
  });
  final OnBoardingModel item;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: item.bgColor,
      padding: EdgeInsets.all(22.w),
      child: Column(
        spacing: 12.h,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          (kToolbarHeight + 24).verticalSpace,
          Center(
            child: SvgPicture.asset(
              item.imagePath,
              height: .3.sh,
              width: .5.sw,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            item.title,
            style: getRegularStyle(
              color: currentIndex == 1
                  ? context.defaultTextColor
                  : context.defaultHintColor,
              fontSize: 36,
            ),
          ),
          Text(
            item.subTitle,
            style: getBoldStyle(
              color: context.defaultTextColor,
              fontSize: 36,
            ),
          ),
          Text(
            item.details,
            textAlign: TextAlign.justify,
            maxLines: null,
            style: getRegularStyle(
              color: context.defaultTextColor,
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: item.buttonColor,
              foregroundColor: item.buttonTextColor,
            ),
            onPressed: item.onPress,
            child: Text(item.buttonText ?? ''),
          ),
        ],
      ),
    );
  }
}
