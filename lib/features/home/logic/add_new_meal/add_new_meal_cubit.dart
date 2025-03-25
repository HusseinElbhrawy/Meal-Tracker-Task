import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meal_tracker/app/injector.dart';
import 'package:meal_tracker/core/enum/request_status.dart';
import 'package:meal_tracker/core/utils/help.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:meal_tracker/features/home/data/repositories/home_repository.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';

part 'add_new_meal_state.dart';

class AddNewMealCubit extends Cubit<AddNewMealState> {
  AddNewMealCubit(
    this._homeRepository,
  ) : super(const AddNewMealState());

  final HomeRepository _homeRepository;

  final TextEditingController mealName = TextEditingController();
  final TextEditingController mealCalories = TextEditingController();
  final TextEditingController mealTime = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void pickNewFile() async {
    final result = await pickCustomFile();
    if (result != null) {
      emit(state.copyWith(pickedImage: File(result.files.single.path!)));
    }
  }

  void removeImage() {
    emit(state.copyWith(pickedImage: File('')));
    log('File Removed ${state.pickedImage?.path}');
  }

  void addNewMeal() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(addNewMealStatus: RequestStatus.loading));
      final response = await _homeRepository.addMeal(
        MealModel(
          name: mealName.text,
          calories: mealCalories.text,
          time: mealTime.text,
          imageUrl: state.pickedImage!.path,
        ),
      );
      response.fold(
        (failure) {
          log('Error Adding Meal: ${failure.message}');
          emit(
            state.copyWith(
              addNewMealStatus: RequestStatus.error,
              addNewMealErrorMessage: failure.message,
            ),
          );
        },
        (id) async {
          log('Meal Added with id $id');
          await serviceLocator<HomeCubit>().getAllMeals();
          emit(state.copyWith(addNewMealStatus: RequestStatus.success));
        },
      );
    }
  }

  void updateTime(TimeOfDay time, BuildContext context) {
    // mealTime.text = time.format(context);
    mealTime.text = time.format(context);
    emit(state.copyWith(pickedTime: time));
  }

  @override
  Future<void> close() {
    mealName.dispose();
    mealCalories.dispose();
    mealTime.dispose();
    log('Add New Meal Cubit Closed');

    var cubit = serviceLocator<AddNewMealCubit>();
    if (isClosed) {
      cubit = AddNewMealCubit(serviceLocator());
      serviceLocator.unregister<AddNewMealCubit>();
      serviceLocator.registerLazySingleton<AddNewMealCubit>(() => cubit);
    }

    return super.close();
  }
}
