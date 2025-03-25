// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/widgets/custom_text_form_field_with_title.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:meal_tracker/features/home/logic/edit_meal/edit_meal_cubit.dart';

import '../../widget/edit/edit_attach_file_widget.dart';
import '../../widget/edit/edit_meal_button_widget.dart';

class EditMealScreen extends StatefulWidget {
  const EditMealScreen({super.key, required this.item});
  final MealModel item;

  @override
  State<EditMealScreen> createState() => _EditMealScreenState();
}

class _EditMealScreenState extends State<EditMealScreen> {
  @override
  void initState() {
    context.read<EditMealCubit>().initData(widget.item);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EditMealCubit>();

    return Scaffold(
      bottomNavigationBar: const EditMealButtonWidget(),
      appBar: AppBar(
        title: const Text('Edi The Meal'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10.w),
        child: Form(
          key: cubit.formKey,
          child: Column(
            spacing: 12.h,
            children: [
              const EditAttachFileWidget(),
              12.verticalSpace,
              CustomTextFormFieldWithTitle(
                hintText: 'Please enter the meal name',
                title: 'Meal Name',
                textInputAction: TextInputAction.next,
                controller: cubit.editMealName,
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
                controller: cubit.editMealCalories,
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
                    context.read<EditMealCubit>().updateTime(time, context);
                  }
                },
                child: CustomTextFormFieldWithTitle(
                  hintText: 'Please enter the meal time',
                  title: 'Time',
                  textInputAction: TextInputAction.next,
                  enabled: false,
                  controller: cubit.editMealTime,
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
