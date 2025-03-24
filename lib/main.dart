import 'package:flutter/material.dart';
import 'package:meal_tracker/app/app.dart';
import 'package:meal_tracker/app/injector.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDI();
  runApp(MyApp());
}
