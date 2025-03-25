// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/widgets/custom_text_form_field_with_title.dart';
import 'package:meal_tracker/features/home/logic/add_new_meal/add_new_meal_cubit.dart';
import 'package:meal_tracker/features/home/presentation/widget/add/add_new_meal_button_widget.dart';
import 'package:meal_tracker/features/home/presentation/widget/add/attach_file_widget.dart';

class AddNewMealScreen extends StatelessWidget {
  const AddNewMealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddNewMealCubit>();
    // var homeState = context.read<HomeState>();
    return Scaffold(
      bottomNavigationBar: const AddNewMealButtonWidget(),
      appBar: AppBar(
        title: const Text('Add New Meal'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Form(
          key: cubit.formKey,
          child: Column(
            spacing: 12.h,
            children: [
              const AttachFileWidget(),
              12.verticalSpace,
              CustomTextFormFieldWithTitle(
                hintText: 'Please enter the meal name',
                title: 'Meal Name',
                textInputAction: TextInputAction.next,
                controller: cubit.mealName,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the meal name';
                  }
                  return null;
                },
              ),
              4.verticalSpace,
              CustomTextFormFieldWithTitle(
                hintText: 'Please enter the meal calories',
                title: 'Meal Calories',
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                controller: cubit.mealCalories,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the meal calories';
                  }
                  return null;
                },
              ),
              4.verticalSpace,
              InkWell(
                onTap: () async {
                  var time = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (time != null) {
                    context.read<AddNewMealCubit>().updateTime(time, context);
                  }
                },
                child: CustomTextFormFieldWithTitle(
                  hintText: 'Please enter the meal time',
                  title: 'Time',
                  enabled: false,
                  textInputAction: TextInputAction.next,
                  controller: cubit.mealTime,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter the meal time';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
