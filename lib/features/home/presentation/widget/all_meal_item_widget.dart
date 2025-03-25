import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/widgets/custom_empty_widget.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';
import 'package:meal_tracker/features/home/presentation/widget/meal_item_widget.dart';

class AllMealItemWidget extends StatelessWidget {
  const AllMealItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.meals.isEmpty) {
            return const CustomEmptyWidget(title: 'No meals found');
          }
          return ListView.separated(
            itemCount: state.meals.length,
            itemBuilder: (context, index) {
              final item = state.meals[index];
              return MealItemWidget(item: item).animate().slideX();
            },
            separatorBuilder: (BuildContext context, int index) {
              return 12.verticalSpace;
            },
          );
        },
      ),
    );
  }
}
