import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendy_app/core/utils/app_colors.dart';

abstract class AppTheme {
  static final ThemeData light = ThemeData(
    primaryColorDark: AppColors.darkBlue,
    primaryColor: AppColors.white,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      foregroundColor: AppColors.pink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.r),
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.white,
      unselectedItemColor: AppColors.black,
      selectedItemColor: AppColors.pink,
      type: BottomNavigationBarType.fixed,
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.5, color: AppColors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.5, color: AppColors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.5, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
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
      titleSmall: GoogleFonts.montserrat(
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.grey,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 27.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.pink,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.pink,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.pink,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),
  );
  static final ThemeData dark = ThemeData(
    primaryColorDark: AppColors.white,
    primaryColor: AppColors.darkBlue,
    scaffoldBackgroundColor: AppColors.darkBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBlue,
      centerTitle: true,
      elevation: 0,
      foregroundColor: AppColors.pink,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: REdgeInsets.symmetric(vertical: 16),
        backgroundColor: AppColors.pink,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(8.r),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.5, color: AppColors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.5, color: AppColors.grey),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
        borderSide: BorderSide(width: 1.5, color: AppColors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.r),
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
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBlue,
      unselectedItemColor: AppColors.white,
      selectedItemColor: AppColors.pink,
      type: BottomNavigationBarType.fixed,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.montserrat(
        fontSize: 17.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.grey,
      ),
      titleMedium: GoogleFonts.montserrat(
        fontSize: 27.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.pink,
      ),
      bodySmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.grey,
      ),
      bodyMedium: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w800,
        color: AppColors.white,
      ),
      labelSmall: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.pink,
        decoration: TextDecoration.underline,
        decorationColor: AppColors.pink,
      ),
      labelMedium: GoogleFonts.montserrat(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      displaySmall: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      displayMedium: GoogleFonts.montserrat(
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.white,
      ),
      headlineSmall: GoogleFonts.montserrat(
        fontSize: 14.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
      headlineMedium: GoogleFonts.montserrat(
        fontSize: 18.sp,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    ),
  );
}
