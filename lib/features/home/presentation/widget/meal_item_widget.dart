import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:meal_tracker/config/routes/app_routes.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';

class MealItemWidget extends StatelessWidget {
  const MealItemWidget({
    super.key,
    required this.item,
  });
  final MealModel item;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        log('Item Tapped ${item.id}');
        context.navigateTo(Routes.editMealRoute, arguments: item);
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
                  context.read<HomeCubit>().removeMeal(item.id!);
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
                  child: Image.file(
                    File(item.imageUrl),
                    fit: BoxFit.fill,
                  ),
                ),
                Expanded(
                  child: Column(
                    spacing: 10.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: getBoldStyle(
                          fontSize: 14.sp,
                          color: context.defaultTextColor,
                        ),
                      ),
                      Text(
                        '${item.calories} Calories',
                        style: getRegularStyle(
                          fontSize: 12,
                          color: context.defaultTextColor,
                        ),
                      ),
                      Text(
                        item.time,
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
