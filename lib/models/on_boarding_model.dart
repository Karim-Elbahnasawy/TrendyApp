import 'package:flutter/widgets.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String description;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnBoardingModel> onBoardingList(BuildContext context) {
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return [
      OnBoardingModel(
        image: AppAssets.onboard1,
        title: appLocalizations.choose_products,
        description: appLocalizations.product_description,
      ),
      OnBoardingModel(
        image: AppAssets.onboard2,
        title: appLocalizations.make_payment,
        description: appLocalizations.payment_description,
      ),
      OnBoardingModel(
        image: AppAssets.onboard3,
        title: appLocalizations.get_your_order,
        description: appLocalizations.order_description,
      ),
    ];
  }
}
