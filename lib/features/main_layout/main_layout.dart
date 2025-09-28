import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/utils/app_constants.dart';
import 'package:trendy_app/providers/language_provider.dart';
import 'package:trendy_app/providers/theme_provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [  
                       
            ],
          ),
          SwitchListTile(
            selected: true,
            activeTrackColor: AppColors.blue,
            title: Text(
              themeProvider.isDark
                  ? appLocalizations.dark
                  : appLocalizations.light,
              style: textTheme.titleSmall,
            ),
            secondary: Icon(
              size: 30,
              themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
            ),
            value: themeProvider.isLight,
            onChanged: (newTheme) {
              themeProvider.changeAppTheme(
                newTheme ? ThemeMode.light : ThemeMode.dark,
              );
            },
          ),
          SwitchListTile(
            selected: true,
            activeTrackColor: AppColors.blue,
            title: Text(
              languageProvider.isEnglish
                  ? appLocalizations.english
                  : appLocalizations.arabic,
              style: textTheme.titleSmall,
            ),
            secondary: Icon(
              size: 30,
              languageProvider.isEnglish ? Icons.language : Icons.language,
            ),
            value: languageProvider.isEnglish,
            onChanged: (newTheme) {
              languageProvider.changeAppLanguage(
                newTheme ? AppConstants.english : AppConstants.arabic,
              );
            },
          ),
        ],
      ),
    );
  }
}
