import 'package:flutter/material.dart';
import 'package:iti_doctor_app/core/style/app_colors.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
    fontFamily: 'Inter',
    appBarTheme: AppBarThemeData(
      titleTextStyle: TextStyle(fontFamily: 'Inter'),
    ),
  );
}
