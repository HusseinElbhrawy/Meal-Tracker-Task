import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';
import 'package:meal_tracker/core/widgets/custom_text_form_field_with_title.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:meal_tracker/features/home/logic/edit_meal/edit_meal_cubit.dart';

import '../../../../../core/enum/request_status.dart';

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
              CustomTextFormFieldWithTitle(
                hintText: 'Please enter the meal time',
                title: 'Time',
                textInputAction: TextInputAction.next,
                controller: cubit.editMealTime,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter the meal time';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EditAttachFileWidget extends StatelessWidget {
  const EditAttachFileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 141.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: BlocBuilder<EditMealCubit, EditMealState>(
        builder: (context, state) {
          var cubit = context.read<EditMealCubit>();

          return Center(
            child: ((state.item != null && state.item!.imageUrl.isNotEmpty) ||
                    (state.pickedImage != null &&
                        state.pickedImage!.path.isNotEmpty))
                ? Card(
                    elevation: 4.r,
                    child: Stack(
                      children: [
                        if (state.item?.imageUrl != null &&
                            state.item!.imageUrl.isNotEmpty)
                          Image.file(
                            File(state.item!.imageUrl),
                            fit: BoxFit.fill,
                            height: 200.h,
                            width: 1.sw,
                          ),
                        if (state.pickedImage != null &&
                            state.pickedImage!.path.isNotEmpty)
                          Image.file(
                            state.pickedImage!,
                            fit: BoxFit.fill,
                            height: 200.h,
                            width: 1.sw,
                          ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.red,
                            ),
                            onPressed: () {
                              cubit.removeImage();
                            },
                          ),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    onTap: () {
                      cubit.pickNewFile();
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5.h,
                      children: [
                        CircleAvatar(
                          backgroundColor: context.primaryColor,
                          radius: 24.r,
                          child: const Icon(Icons.upload),
                        ),
                        Text(
                          'Please attach a picture of your Offer.',
                          style:
                              getMediumStyle(color: context.defaultTextColor),
                        ),
                      ],
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class EditMealButtonWidget extends StatelessWidget {
  const EditMealButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<EditMealCubit>();
    return BlocListener<EditMealCubit, EditMealState>(
      listener: (context, state) {
        if (state.editMealStatus == RequestStatus.success) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              backgroundColor: Colors.green,
              content: Text('Meal Edited Successfully'),
            ),
          );
          Navigator.pop(context);
        } else if (state.editMealStatus == RequestStatus.error) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              content: Text(state.editMealErrorMessage.toString()),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 24.h),
        child: ElevatedButton(
          onPressed: () {
            if ((cubit.state.pickedImage == null ||
                    cubit.state.pickedImage!.path.isEmpty) &&
                (cubit.state.item!.imageUrl.isEmpty)) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text('Please attach a picture of your Offer.'),
                ),
              );
            } else {
              cubit.editMeal();
            }
          },
          child: const Text('Edit The Meal'),
        ),
      ),
    );
  }
}
