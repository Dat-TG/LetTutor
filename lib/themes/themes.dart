// Light theme data
import 'package:flutter/material.dart';
import 'package:let_tutor/core/utils/colors.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryElement,
  ),
  primaryColor: AppColors.primaryElement,
  secondaryHeaderColor: AppColors.secondaryElement,
  cardColor: AppColors.cardColorLight,
  splashColor: Colors.white,
  scaffoldBackgroundColor: AppColors.primaryBackground,
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primaryBackground,
    titleTextStyle: TextStyle(
      color: AppColors.primaryElement,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(),
  ),
  iconTheme: const IconThemeData(color: Colors.black),
  brightness: Brightness.light,
);

// Dark theme data
final ThemeData darkTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primaryElement,
    brightness: Brightness.dark,
  ),
  primaryColor: const Color.fromRGBO(0, 113, 240, 1),
  splashColor: AppColors.darkSurface,
  secondaryHeaderColor: AppColors.secondaryElement,
  scaffoldBackgroundColor: AppColors.darkModeBackground,
  appBarTheme: const AppBarTheme(
    shadowColor: Colors.white,
    backgroundColor: AppColors.darkModeBackground,
    titleTextStyle: TextStyle(
      color: AppColors.primaryElement,
      fontSize: 20,
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
  ),
  iconTheme: const IconThemeData(color: Colors.white),
  cardColor: AppColors.darkSurface,
  brightness: Brightness.dark,
);
