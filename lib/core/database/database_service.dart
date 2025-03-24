import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:meal_tracker/core/utils/constant.dart';
import 'package:meal_tracker/features/home/data/models/meal_model.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Future<void> initDatabase() async {
    final path = await getApplicationDocumentsDirectory();
    Hive.initFlutter(path.path);
    await BoxCollection.open(
      AppConstant.mealDatabase,
      {AppConstant.mealBox},
      path: path.path,
    ).then((value) async {
      log('Database is opened');
      Hive.registerAdapter(MealModelAdapter());
      var box = await Hive.openBox<MealModel>(AppConstant.mealBox);
      log('Meal Box is opened ${box.isOpen}');
    }).catchError(
      (error) {
        log('Database is not opened with error $error');
      },
    );
  }
}
