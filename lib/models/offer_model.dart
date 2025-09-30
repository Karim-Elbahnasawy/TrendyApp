import 'package:flutter/widgets.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';

class OfferModel {
  String image;
  String title;
  String discount;

  OfferModel({required this.image,required this.title,required this.discount});

  static List<OfferModel> offers (BuildContext context){
  final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return [
    OfferModel(image: AppAssets.offer, title: appLocalizations.offer_title, discount: appLocalizations.discount),
    OfferModel(image: AppAssets.offer, title: appLocalizations.offer_title, discount: appLocalizations.discount),
    OfferModel(image: AppAssets.offer, title: appLocalizations.offer_title, discount: appLocalizations.discount),
    OfferModel(image: AppAssets.offer, title: appLocalizations.offer_title, discount: appLocalizations.discount),
    ];
  }
}