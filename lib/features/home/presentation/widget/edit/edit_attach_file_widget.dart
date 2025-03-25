import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';
import 'package:meal_tracker/features/home/logic/edit_meal/edit_meal_cubit.dart';

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
