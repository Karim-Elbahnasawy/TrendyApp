import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendy_app/core/utils/app_colors.dart';

abstract class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
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
    ),
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: AppColors.darkBlue,
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
    ),
  );
}
