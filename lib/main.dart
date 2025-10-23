import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/app/trendy_app.dart';
import 'package:trendy_app/config/prefs/cache_helper.dart';
import 'package:trendy_app/providers/cart_provider.dart';
import 'package:trendy_app/providers/favourite_provider.dart';
import 'package:trendy_app/providers/home_provider.dart';
import 'package:trendy_app/providers/language_provider.dart';
import 'package:trendy_app/providers/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => LanguageProvider()),
        ChangeNotifierProvider(create: (context)=> CartProvider()),
        ChangeNotifierProvider(create: (context)=> FavouriteProvider()),
       ChangeNotifierProvider(create: (context)=> HomeProvider())
      ],
      child: const TrendyApp(),
    ),
  );
}
