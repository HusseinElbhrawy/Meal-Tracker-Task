import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 12.h,
        children: [
          LottieBuilder.asset(
            'assets/lottie/empty.json',
            height: 200.h,
            width: 200.w,
          ),
          Text(
            title,
          ),
        ],
      ),
    );
  }
}
