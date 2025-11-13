import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF14181F); // Deep Blue
  static const Color accentColor = Color(0xFFFFC107); // Amber
  static const Color backgroundColor1 = Color(0xFF191E26);
  static const Color backgroundColor2 = Color(0xFF14181F);
  static const Color textColor = Color(0xFF8BA6A3);
  static const Color lightTextColor = Color(0xFF3CDE77);
  static const Color cardColor = Color(0xFF1C2129);
  static const Color dividerColor = Color(0xFFE0E0E0); // Lighter Grey
  static const Color clipFillColor = Color(0xFF203632);
}

class AppTheme {
  static TextStyle titleText = TextStyle(
    fontSize: 40,
    // fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static TextStyle titleGreenText = TextStyle(
    fontSize: 40,
    // fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.lightTextColor,
  );

  static TextStyle subtitleText = TextStyle(
    fontSize: 18,
    color: AppColors.textColor,
  );

  static TextStyle bodyText = TextStyle(
    fontSize: 16,
    color: AppColors.textColor,
  );

  static TextStyle clipText = TextStyle(
    fontSize: 16,
    color: AppColors.lightTextColor,
  );

  static ThemeData themeData = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.backgroundColor1,
    cardColor: AppColors.cardColor,
    dividerColor: AppColors.dividerColor,
  );
}
