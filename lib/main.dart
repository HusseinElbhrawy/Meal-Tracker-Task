import 'package:flutter/material.dart';
import 'package:meal_tracker/app/app.dart';
import 'package:meal_tracker/app/injector.dart';
import 'package:meal_tracker/core/database/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseService.initDatabase();

  await initDI();

  runApp(MyApp());
}
