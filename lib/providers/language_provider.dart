import 'package:flutter/material.dart';
import 'package:trendy_app/config/prefs/cache_helper.dart';
import 'package:trendy_app/core/utils/app_constants.dart';

class LanguageProvider extends ChangeNotifier {
  String currentLanguage =
      CacheHelper.getSavedLanguage() ?? AppConstants.arabic;

  void changeAppLanguage(String newLanguage) {
    if (currentLanguage == newLanguage) return;
    currentLanguage = newLanguage;
    CacheHelper.saveLanguage(currentLanguage);
    notifyListeners();
  }

  bool get isEnglish => currentLanguage == AppConstants.english;
}
