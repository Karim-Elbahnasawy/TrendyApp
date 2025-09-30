import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendy_app/core/utils/app_assets.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Column(
          children: [
            Center(
              child: SvgPicture.asset(
                AppAssets.logo,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
