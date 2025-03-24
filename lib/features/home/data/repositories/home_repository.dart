import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:meal_tracker/core/errors/failure.dart';
import 'package:meal_tracker/core/typedef/typedef.dart';
import 'package:meal_tracker/features/home/data/datasources/home_local_data_source.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';

class HomeRepository {
  final HomeLocalDataSource _dataSource;

  HomeRepository(this._dataSource);

  DefaultResponse<List<MealModel>> getAllMeals() async {
    try {
      final response = await _dataSource.getMeals();
      log('Get Meals Response is $response');
      return Right(response);
    } catch (e) {
      log("Error All Meals: $e");
      return Left(DatabaseFailure(message: 'Something went wrong $e'));
    }
  }

  DefaultResponse<int> addMeal(MealModel meal) async {
    try {
      var id = await _dataSource.addNewMeal(meal);
      return Right(id);
    } catch (e) {
      log("Error Add Meal: $e");
      return Left(DatabaseFailure(message: 'Something went wrong $e'));
    }
  }

  DefaultResponse<Unit> updateMeal(MealModel meal) async {
    try {
      await _dataSource.updateMeal(meal);
      return const Right(unit);
    } catch (e) {
      log("Error Update Meal: $e");
      return Left(DatabaseFailure(message: 'Something went wrong $e'));
    }
  }

  DefaultResponse<Unit> deleteMeal(int id) async {
    try {
      await _dataSource.deleteMeal(id);
      return const Right(unit);
    } catch (e) {
      log("Error Delete Meal: $e");
      return Left(DatabaseFailure(message: 'Something went wrong $e'));
    }
  }

  DefaultResponse<Unit> clearMeals() async {
    try {
      await _dataSource.clearMeals();
      return const Right(unit);
    } catch (e) {
      log("Error Clear Meals: $e");
      return Left(DatabaseFailure(message: 'Something went wrong $e'));
    }
  }
}
