import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendy_app/core/utils/app_colors.dart';

abstract class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.blue,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.blue,
      ),
    ),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      elevation: 0,
      backgroundColor: AppColors.darkBlue,
      foregroundColor: AppColors.white,
    ),
    textTheme: TextTheme(
      titleSmall: GoogleFonts.poppins(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    ),
  );
}
