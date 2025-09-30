import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/models/offer_model.dart';

class OfferItem extends StatelessWidget {
  const OfferItem({super.key, required this.offersModel});

  final OfferModel offersModel;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;

    return Container(
      height: 300.h,
      width: double.infinity,
      padding: REdgeInsets.symmetric(horizontal: 16),
      margin: REdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.pink,
        image: DecorationImage(
          image: AssetImage(offersModel.image),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            offersModel.discount,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 10.h),
          Text(
            offersModel.title,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SizedBox(height: 20.h),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(8),
              ),
              padding: REdgeInsets.symmetric(horizontal: 16, vertical: 8),
              side: BorderSide(color: AppColors.white, width: 2),
            ),
            onPressed: () {},
            child: Text(
              appLocalizations.shop_now,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
