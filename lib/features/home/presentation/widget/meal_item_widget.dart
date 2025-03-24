import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('Item Tapped');
      },
      child: Container(
        // padding: EdgeInsets.all(10.sp),
        // height: 120.h,
        width: 1.sw,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                backgroundColor: context.redColor,
                onPressed: (context) {
                  log('Delete Item');
                },
                borderRadius: BorderRadius.circular(12.r),
                spacing: 12.w,
                autoClose: true,
                icon: Icons.delete,
                foregroundColor: context.surface,
                label: 'Delete',
              ),
            ],
          ),
          child: Card(
            margin: EdgeInsets.zero,
            child: Row(
              spacing: 15.w,
              children: [
                Container(
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    color: context.greyColor.withValues(alpha: .2),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Image.asset(
                    'assets/images/example.png',
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Name',
                        style: getBoldStyle(
                          fontSize: 14.sp,
                          color: context.defaultTextColor,
                        ),
                      ),
                      Text(
                        '500 Calories',
                        style: getRegularStyle(
                          fontSize: 12,
                          color: context.defaultTextColor,
                        ),
                      ),
                      Text(
                        'Tuesday, 03 March 2025',
                        style: getRegularStyle(
                          fontSize: 12,
                          color: context.defaultTextColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
