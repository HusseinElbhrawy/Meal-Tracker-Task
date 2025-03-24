import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_tracker/app/injector.dart';
import 'package:meal_tracker/core/enum/request_status.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:meal_tracker/features/home/data/repositories/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(
    this._homeRepository,
  ) : super(const HomeState());

  final HomeRepository _homeRepository;

  Future<void> getAllMeals() async {
    emit(state.copyWith(getAllMealsStatus: RequestStatus.loading));
    final response = await _homeRepository.getAllMeals();
    response.fold(
      (failure) {
        log('Error Getting All Meals: ${failure.message}');
        emit(
          state.copyWith(
            getAllMealsStatus: RequestStatus.error,
            getAllMealsErrorMessage: failure.message,
          ),
        );
      },
      (meals) {
        log('Get All meals Response is $meals');
        emit(
          state.copyWith(
            getAllMealsStatus: RequestStatus.success,
            meals: meals,
          ),
        );
      },
    );
  }

  void removeMeal(int id) async {
    emit(state.copyWith(removeMealStatus: RequestStatus.loading));
    final response = await _homeRepository.deleteMeal(id);
    response.fold(
      (failure) {
        log('Error Removing Meal: ${failure.message}');
        emit(
          state.copyWith(
            removeMealStatus: RequestStatus.error,
            removeMealErrorMessage: failure.message,
          ),
        );
      },
      (id) async {
        log('Meal Removed with id $id');
        await getAllMeals();
        emit(state.copyWith(removeMealStatus: RequestStatus.success));
      },
    );
  }

  void sortMeals(String sortBy, {String order = 'ascending'}) {
    log('Sort By: $sortBy');
    var meals = List<MealModel>.from(state.meals);

    switch (sortBy) {
      case 'calories':
        meals.sort((a, b) => a.calories.compareTo(b.calories));
        break;
      case 'time':
        meals.sort((a, b) => a.time.compareTo(b.time));
        break;
      case 'name':
        meals.sort((a, b) => a.name.compareTo(b.name));
        break;

      default:
        meals.sort((a, b) => a.name.compareTo(b.name));
        break;
    }
    if (order == 'descending') {
      meals = meals.reversed.toList();
    }

    emit(state.copyWith(meals: meals));
  }

  @override
  Future<void> close() {
    log('Home Cubit Closed');

    var cubit = serviceLocator<HomeCubit>();
    if (isClosed) {
      cubit = HomeCubit(serviceLocator());
      serviceLocator.unregister<HomeCubit>();
      serviceLocator.registerLazySingleton<HomeCubit>(() => cubit);
    }

    return super.close();
  }
}
