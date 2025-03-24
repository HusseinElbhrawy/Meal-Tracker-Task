import 'dart:developer';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracker/app/injector.dart';
import 'package:meal_tracker/core/enum/request_status.dart';
import 'package:meal_tracker/core/utils/help.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:meal_tracker/features/home/data/repositories/home_repository.dart';
import 'package:meal_tracker/features/home/logic/home/home_cubit.dart';

part 'edit_meal_state.dart';

class EditMealCubit extends Cubit<EditMealState> {
  EditMealCubit(
    this._homeRepository,
  ) : super(const EditMealState());

  final HomeRepository _homeRepository;

  final TextEditingController editMealName = TextEditingController();
  final TextEditingController editMealCalories = TextEditingController();
  final TextEditingController editMealTime = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void initData(MealModel item) {
    editMealName.text = item.name;
    editMealCalories.text = item.calories;
    editMealTime.text = item.time;
    emit(state.copyWith(item: item));

    log('Item name  ${item.name} with id ${item.id} with image ${item.imageUrl}');
  }

  void pickNewFile() async {
    final result = await pickCustomFile();
    if (result != null) {
      emit(state.copyWith(pickedImage: File(result.files.single.path!)));
    }
  }

  void removeImage() {
    if (state.pickedImage == null) {
      var item = state.item;
      item = item!.copyWith(imageUrl: '');

      emit(state.copyWith(item: item));
    } else {
      emit(state.copyWith(pickedImage: File('')));
    }
  }

  void editMeal() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(editMealStatus: RequestStatus.loading));
      var image = '';
      if ((state.pickedImage != null && state.pickedImage!.path.isNotEmpty)) {
        image = state.pickedImage!.path;
      } else {
        image = state.item!.imageUrl;
      }
      final response = await _homeRepository.updateMeal(
        MealModel(
          id: state.item!.id,
          name: editMealName.text,
          calories: editMealCalories.text,
          time: editMealTime.text,
          imageUrl: image,
        ),
      );
      response.fold(
        (failure) {
          log('Error Adding Meal: ${failure.message}');
          emit(
            state.copyWith(
              editMealStatus: RequestStatus.error,
              editMealErrorMessage: failure.message,
            ),
          );
        },
        (id) async {
          log('Meal Edited with id $id');
          await serviceLocator<HomeCubit>().getAllMeals();
          emit(state.copyWith(editMealStatus: RequestStatus.success));
        },
      );
    }
  }

  @override
  Future<void> close() {
    editMealName.dispose();
    editMealCalories.dispose();
    editMealTime.dispose();
    log('Edit Meal Cubit Closed');

    var cubit = serviceLocator<EditMealCubit>();
    if (isClosed) {
      cubit = EditMealCubit(serviceLocator());
      serviceLocator.unregister<EditMealCubit>();
      serviceLocator.registerLazySingleton<EditMealCubit>(() => cubit);
    }

    return super.close();
  }
}
