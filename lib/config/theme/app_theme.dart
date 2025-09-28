import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendy_app/core/utils/app_colors.dart';

abstract class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      foregroundColor: AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.r),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.red),
      ),
      hintStyle: GoogleFonts.montserrat(
        color: AppColors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
      contentPadding: REdgeInsets.symmetric(vertical: 20),
      fillColor: AppColors.greyF3,
      filled: true,
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.montserrat(
        fontSize: 27.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryColor,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.grey,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryColor,
      ),
    ),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      elevation: 0,
      foregroundColor: AppColors.primaryColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.r),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(width: 1.5, color: AppColors.red),
      ),
      contentPadding: REdgeInsets.symmetric(vertical: 20),
      fillColor: AppColors.greyF3,
      filled: true,
      hintStyle: GoogleFonts.montserrat(
        color: AppColors.grey,
        fontSize: 15,
        fontWeight: FontWeight.w600,
      ),
    ),
    textTheme: TextTheme(
      titleMedium: GoogleFonts.montserrat(
        fontSize: 27.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.primaryColor,
      ),
      titleSmall: GoogleFonts.montserrat(
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.grey,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.primaryColor,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.primaryColor,
      ),
    ),
  );
}
