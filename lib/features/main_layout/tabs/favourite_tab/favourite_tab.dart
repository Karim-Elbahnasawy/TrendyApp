import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/widgets/custom_text_form_field.dart';
import 'package:trendy_app/features/main_layout/tabs/favourite_tab/favourite_products_grid_view.dart';

class FavouriteTab extends StatelessWidget {
  const FavouriteTab({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              spacing: 16.h,
              children: [
                SvgPicture.asset(
                  AppAssets.logo,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                ),
                CustomTextFormField(
                  prefixIcon: Icon(Icons.search),
                  hintText: appLocalizations.search_for_any_product,
                ),
                FavouriteProductsGridView(),
                 SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
