import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OnBoardingModel extends Equatable {
  final String imagePath;
  final Color bgColor;
  final String title;
  final String subTitle;
  final String details;

  final String? buttonText;
  final Color? buttonColor;
  final Color? buttonTextColor;
  final VoidCallback? onPress;

  const OnBoardingModel({
    required this.imagePath,
    required this.bgColor,
    required this.title,
    required this.subTitle,
    required this.details,
    this.buttonText,
    this.buttonColor,
    this.buttonTextColor,
    this.onPress,
  });

  @override
  List<Object?> get props {
    return [
      imagePath,
      bgColor,
      title,
      subTitle,
      details,
      buttonText,
      buttonColor,
      buttonTextColor,
      onPress,
    ];
  }
}
