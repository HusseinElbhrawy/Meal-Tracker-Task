// ignore_for_file: must_be_immutable

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'meal_model.g.dart';

@HiveType(typeId: 0)
// Equatable with
class MealModel extends Equatable with HiveObjectMixin {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String calories;

  @HiveField(3)
  final String time;

  @HiveField(4)
  final String imageUrl;

  MealModel({
    this.id,
    required this.name,
    required this.calories,
    required this.time,
    required this.imageUrl,
  });

  @override
  List<Object?> get props {
    return [
      id,
      name,
      calories,
      time,
      imageUrl,
    ];
  }

  MealModel copyWith({
    int? id,
    String? name,
    String? calories,
    String? time,
    String? imageUrl,
  }) {
    return MealModel(
      id: id ?? this.id,
      name: name ?? this.name,
      calories: calories ?? this.calories,
      time: time ?? this.time,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'calories': calories,
      'time': time,
      'imageUrl': imageUrl,
    };
  }

  factory MealModel.fromMap(Map<String, dynamic> map) {
    return MealModel(
      id: map['id'] as int,
      name: map['name'] as String,
      calories: map['calories'] as String,
      time: map['time'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MealModel.fromJson(String source) =>
      MealModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;
}
