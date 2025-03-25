import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:meal_tracker/core/utils/media_query_values.dart';
import 'package:meal_tracker/core/utils/style_manager.dart';
import 'package:meal_tracker/features/home/logic/add_new_meal/add_new_meal_cubit.dart';

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
