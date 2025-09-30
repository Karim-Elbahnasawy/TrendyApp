import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/core/utils/app_constants.dart';
import 'package:trendy_app/core/widgets/custom_icon.dart';
import 'package:trendy_app/providers/language_provider.dart';
import 'package:trendy_app/providers/theme_provider.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomIcon(
              onPressed: () {
                themeProvider.currentTheme == ThemeMode.light
                    ? themeProvider.changeAppTheme(ThemeMode.dark)
                    : themeProvider.changeAppTheme(ThemeMode.light);
              },
              icon: themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
            ),
            CustomIcon(
              onPressed: () {
                languageProvider.currentLanguage == AppConstants.english
                    ? languageProvider.changeAppLanguage(AppConstants.arabic)
                    : languageProvider.changeAppLanguage(AppConstants.english);
              },
              icon: Icons.language,
            ),
          ],
        ),
      ),
    );
  }
}
