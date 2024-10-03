import 'package:flashcards/core/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData appTheme = ThemeData.dark().copyWith(
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.cornflowerBlue,
      onPrimary: AppColors.white,
      secondary: AppColors.pink,
      onSecondary: AppColors.white,
      error: Color(0xffc30010),
      onError: AppColors.white,
      surface: AppColors.pink,
      onSurface: AppColors.white,
    ),
    primaryColor: AppColors.cornflowerBlue,
    primaryColorLight: AppColors.white,
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.grey,
      elevation: 0.0,
    ),
  );
}
