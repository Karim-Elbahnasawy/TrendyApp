import 'package:flutter/material.dart';
import 'package:trendy_app/config/prefs/cache_helper.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode currentTheme = CacheHelper.getSavedTheme() ?? ThemeMode.light;

  void changeAppTheme(ThemeMode newTheme) {
    if (currentTheme == newTheme) return;
    currentTheme = newTheme;
    CacheHelper.saveTheme(currentTheme);
    notifyListeners();
  }

  bool get isDark => currentTheme == ThemeMode.dark;
  bool get isLight => currentTheme == ThemeMode.light;
}
