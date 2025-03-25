import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/features/home/logic/edit_meal/edit_meal_cubit.dart';

import '../../../../../core/enum/request_status.dart';

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
