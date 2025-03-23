import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:meal_tracker/core/utils/app_assets.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';

//* Text For Errors
CancelFunc showCustomErrorText({
  required BuildContext context,
  required String text,
}) {
  return BotToast.showText(
    text: text,
    textStyle: context.textTheme.bodySmall!.copyWith(
      color: context.whiteColor,
    ),
    contentColor: context.redColor,
  );
}

//* Loading
CancelFunc showCustomLoadingWidget(BuildContext context) {
  return BotToast.showCustomLoading(
    toastBuilder: (builder) => Container(
      height: 120.h,
      width: 120.w,
      decoration: BoxDecoration(
        color: context.surface,
        borderRadius: BorderRadius.circular(12.r),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      child: Center(
        child: LottieBuilder.asset(
          AppLottieAssets.loading,
          height: 120.h,
          width: 120.w,
        ),
      ),
    ),
  );
}
