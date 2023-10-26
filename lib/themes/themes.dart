// Light theme data
import 'package:flutter/material.dart';
import 'package:let_tutor/utils/colors.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryElement,
  ),
  primaryColor: AppColors.primaryElement,
  secondaryHeaderColor: AppColors.secondaryElement,
  scaffoldBackgroundColor: AppColors.primaryBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryBackground,
    titleTextStyle: TextStyle(
      color: AppColors.primaryElement,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  brightness: Brightness.light,
);

// Dark theme data
final ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryElement,
    brightness: Brightness.dark,
  ),
  primaryColor: AppColors.primaryElement,
  secondaryHeaderColor: AppColors.secondaryElement,
  scaffoldBackgroundColor: AppColors.primaryBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryBackground,
    titleTextStyle: TextStyle(
      color: AppColors.primaryElement,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  brightness: Brightness.dark,
);
