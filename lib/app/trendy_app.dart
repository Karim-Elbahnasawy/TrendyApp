import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/theme/app_theme.dart';
import 'package:trendy_app/core/utils/app_router.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/providers/language_provider.dart';
import 'package:trendy_app/providers/theme_provider.dart';

class TrendyApp extends StatelessWidget {
  const TrendyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);
    return ScreenUtilInit(
      designSize: Size(393, 841),
      splitScreenMode: true,
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.splash,
        onGenerateRoute: AppRouter.router,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: themeProvider.currentTheme,
        supportedLocales: AppLocalizations.supportedLocales,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        locale: Locale(languageProvider.currentLanguage),
      ),
    );
  }
}
