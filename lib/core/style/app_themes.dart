import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    ),
    fontFamily: 'Inter',
    appBarTheme: AppBarThemeData(
      titleTextStyle: TextStyle(
        fontFamily: 'Inter',
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
    ),
  );
}
