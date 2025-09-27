import 'package:flutter/cupertino.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/features/auth/login/login.dart';
import 'package:trendy_app/features/auth/register/register.dart';

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
    }
    return null;
  }
}
