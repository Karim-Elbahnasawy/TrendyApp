import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trendy_app/core/utils/app_constants.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static void saveTheme(ThemeMode newTheme) {
    String theme = newTheme == ThemeMode.light ? 'Light' : 'Dark';
    prefs.setString(AppConstants.themeKey, theme);
  }

  static ThemeMode? getSavedTheme() {
    String? savedTheme = prefs.getString(AppConstants.themeKey);
    if (savedTheme == null) {
      return null;
    } else {
      ThemeMode themeMode = savedTheme == "Light"
          ? ThemeMode.light
          : ThemeMode.dark;
      return themeMode;
    }
  }

  static void saveLanguage(String language) {
    prefs.setString(AppConstants.languageKey, language);
  }

  static String? getSavedLanguage() {
    String? savedLanguage = prefs.getString(AppConstants.languageKey);
    return savedLanguage;
  }
}
