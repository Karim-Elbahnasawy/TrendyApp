import 'package:flutter/cupertino.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/features/auth/forget_password/forget_password.dart';
import 'package:trendy_app/features/auth/login/login.dart';
import 'package:trendy_app/features/auth/register/register.dart';
import 'package:trendy_app/features/main_layout/main_layout.dart';
import 'package:trendy_app/features/on_boarding/on_boarding.dart';
import 'package:trendy_app/features/product_details/product_details.dart';
import 'package:trendy_app/features/splash/splash.dart';
import 'package:trendy_app/models/product_model.dart';

abstract class AppRouter {
  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.register:
        {
          return CupertinoPageRoute(builder: (context) => Register());
        }
      case AppRoutes.login:
        {
          return CupertinoPageRoute(builder: (context) => Login());
        }
      case AppRoutes.splash:
        {
          return CupertinoPageRoute(builder: (context) => Splash());
        }
      case AppRoutes.onBoarding:
        {
          return CupertinoPageRoute(builder: (context) => OnBoarding());
        }
      case AppRoutes.fogetPassword:
        {
          return CupertinoPageRoute(builder: (context) => ForgetPassword());
        }
      case AppRoutes.mainLayout:
        {
          return CupertinoPageRoute(builder: (context) => MainLayout());
        }
      case AppRoutes.productDetails:
        {
          ProductModel productModel = settings.arguments as ProductModel;
          return CupertinoPageRoute(
            builder: (context) => ProductDetails(productModel: productModel),
          );
        }
    }
    return null;
  }
}
