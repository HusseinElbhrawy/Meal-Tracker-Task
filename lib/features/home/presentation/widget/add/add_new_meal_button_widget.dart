import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/features/home/logic/add_new_meal/add_new_meal_cubit.dart';

import '../../../../../core/enum/request_status.dart';

class AddNewMealButtonWidget extends StatelessWidget {
  const AddNewMealButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AddNewMealCubit>();
    return BlocListener<AddNewMealCubit, AddNewMealState>(
      listenWhen: (previous, current) =>
          previous.addNewMealStatus != current.addNewMealStatus,
      listener: (context, state) {
        if (state.addNewMealStatus == RequestStatus.success) {
          // context.read<HomeCubit>().getAllMeals();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Meal Added Successfully'),
            ),
          );
          context.mayPop();
        } else if (state.addNewMealStatus == RequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.addNewMealErrorMessage!),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
        child: ElevatedButton(
          onPressed: () {
            if (cubit.state.pickedImage == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Please attach a picture of your Offer.'),
                ),
              );
            } else {
              cubit.addNewMeal();
            }
          },
          child: const Text('Add Meal'),
        ),
      ),
    );
  }
}
