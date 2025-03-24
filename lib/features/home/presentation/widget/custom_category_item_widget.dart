import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';

class CustomCategoryItemWidget extends StatelessWidget {
  const CustomCategoryItemWidget({
    super.key,
    required this.title,
    this.bgColor,
    this.textColor,
    this.onTap,
  });
  final String title;
  final Color? textColor;
  final Color? bgColor;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const WidgetStatePropertyAll(Colors.transparent),
      onTap: onTap,
      child: AnimatedContainer(
        // width: 90.w,
        margin: EdgeInsetsDirectional.only(
          end: 12.w,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 5.h,
        ),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: bgColor ?? Colors.orange,
        ),
        duration: const Duration(milliseconds: 300),
        child: Text(
          title,
          style: getMediumStyle(
            color: textColor ?? Colors.white,
          ),
        ),
      ),
    );
  }
}
