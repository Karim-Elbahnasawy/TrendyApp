import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/utils/app_constants.dart';
import 'package:trendy_app/providers/language_provider.dart';
import 'package:trendy_app/providers/theme_provider.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  final bool isSelceted = true;

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appLocalizations.create_account,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: Column(
        children: [
          Text(
            appLocalizations.password,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SwitchListTile(
            selected: true,
            activeTrackColor: AppColors.blue,
            title: Text(
              themeProvider.isDark
                  ? appLocalizations.dark
                  : appLocalizations.light,
              style: Theme.of(context).textTheme.titleSmall,
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
              style: Theme.of(context).textTheme.titleSmall,
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
