import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  final bool isSelceted = true;

  @override
  Widget build(BuildContext context) {
    // AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    // ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    // LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: Column(
        children: [
          // SwitchListTile(
          //   selected: true,
          //   activeTrackColor: AppColors.blue,
          //   title: Text(
          //     themeProvider.isDark
          //         ? appLocalizations.dark
          //         : appLocalizations.light,
          //     style: Theme.of(context).textTheme.titleSmall,
          //   ),
          //   secondary: Icon(
          //     size: 30,
          //     themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
          //   ),
          //   value: themeProvider.isLight,
          //   onChanged: (newTheme) {
          //     themeProvider.changeAppTheme(
          //       newTheme ? ThemeMode.light : ThemeMode.dark,
          //     );
          //   },
          // ),
          // SwitchListTile(
          //   selected: true,
          //   activeTrackColor: AppColors.blue,
          //   title: Text(
          //     languageProvider.isEnglish
          //         ? appLocalizations.english
          //         : appLocalizations.arabic,
          //     style: Theme.of(context).textTheme.titleSmall,
          //   ),
          //   secondary: Icon(
          //     size: 30,
          //     languageProvider.isEnglish ? Icons.language : Icons.language,
          //   ),
          //   value: languageProvider.isEnglish,
          //   onChanged: (newTheme) {
          //     languageProvider.changeAppLanguage(
          //       newTheme ? AppConstants.english : AppConstants.arabic,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
