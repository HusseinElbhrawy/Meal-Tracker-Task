import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';
import 'package:meal_tracker/core/widgets/custom_text_form_field_with_title.dart';
import 'package:meal_tracker/features/home/logic/add_new_meal/add_new_meal_cubit.dart';

import '../../../../../core/enum/request_status.dart';

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
              CustomTextFormFieldWithTitle(
                hintText: 'Please enter the meal time',
                title: 'Time',
                textInputAction: TextInputAction.next,
                controller: cubit.mealTime,
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

class AttachFileWidget extends StatefulWidget {
  const AttachFileWidget({super.key});

  @override
  State<AttachFileWidget> createState() => _AttachFileWidgetState();
}

class _AttachFileWidgetState extends State<AttachFileWidget> {
  @override
  Widget build(BuildContext context) {
    var cubit = context.read<AddNewMealCubit>();

    return Container(
      height: 141.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.r),
      ),
      child: BlocBuilder<AddNewMealCubit, AddNewMealState>(
        builder: (context, state) {
          return Center(
            child: (state.pickedImage != null &&
                    state.pickedImage!.path.isNotEmpty)
                ? Card(
                    elevation: 4.r,
                    child: Stack(
                      children: [
                        Center(
                          child: Image.file(
                            state.pickedImage!,
                            fit: BoxFit.cover,
                          ),
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
