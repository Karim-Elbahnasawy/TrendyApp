import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendy_app/config/prefs/cache_helper.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/utils/app_routes.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void navigate() {
    if (CacheHelper.getOnBoarding()) {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRoutes.register);
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, AppRoutes.onBoarding);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    navigate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [SvgPicture.asset(AppAssets.logo)],
      ),
    );
  }
}
