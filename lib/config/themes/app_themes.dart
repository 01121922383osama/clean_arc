import 'package:clean_arc/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData.light(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navey,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 28,
      ),
    ),
  );
  static ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.navey,
      titleTextStyle: TextStyle(
        color: AppColors.white,
        fontSize: 28,
      ),
    ),
  );
}
