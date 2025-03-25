import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:meal_tracker/core/utils/constant.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';

class HomeLocalDataSource {
  final Box<MealModel> _mealBox = Hive.box<MealModel>(AppConstant.mealBox);

  Future<int> addNewMeal(MealModel meal) async {
    var id = await _mealBox.add(meal);
    log('Meal add with id: $id');
    final updatedMeal = meal.copyWith(id: id);
    await _mealBox.put(id, updatedMeal);
    return id;
  }

  Future<void> deleteMeal(int id) async {
    return await _mealBox.delete(id);
  }

  Future<List<MealModel>> getMeals() async {
    return _mealBox.values.toList();
  }

  Future<void> updateMeal(MealModel meal) async {
    await _mealBox.put(meal.id, meal);
  }

  MealModel? getMealById(int id) {
    return _mealBox.get(id);
  }

  Future<void> clearMeals() async {
    await _mealBox.clear();
  }
}
