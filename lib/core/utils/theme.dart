import 'package:bluestone_assignment/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColors.primaryColor,
      ),
      color: AppColors.white,
    ),
    fontFamily: 'Urbanist',
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 57.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.25,
        fontFamily: 'Urbanist',
        color: AppColors.white,
      ),
      displayMedium: TextStyle(
        fontSize: 45.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        fontFamily: 'Urbanist',
      ),
      displaySmall: TextStyle(
        fontSize: 36.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        fontFamily: 'Urbanist',
      ),
      headlineLarge: TextStyle(
        fontSize: 32.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: 'Urbanist',
      ),
      headlineMedium: TextStyle(
        fontSize: 28.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: 'Urbanist',
      ),
      headlineSmall: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: 'Urbanist',
      ),
      titleLarge: TextStyle(
        fontSize: 22.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: 'Urbanist',
      ),
      titleMedium: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: 'Urbanist',
      ),
      titleSmall: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
        fontFamily: 'Urbanist',
      ),
      labelLarge: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.1,
        fontFamily: 'Urbanist',
      ),
      labelMedium: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'Urbanist',
      ),
      labelSmall: TextStyle(
        fontSize: 11.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'Urbanist',
      ),
      bodyLarge: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: 'Urbanist',
      ),
      bodyMedium: TextStyle(
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        fontFamily: 'Urbanist',
      ),
      bodySmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        fontFamily: 'Urbanist',
      ),
    ),
  );
}
