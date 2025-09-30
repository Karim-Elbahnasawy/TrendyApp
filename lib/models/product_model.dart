import 'package:flutter/widgets.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';

class ProductModel {
  String image;
  String name;
  String description;
  double price;
  double rating;


  ProductModel({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
  });

 static List<ProductModel> products (BuildContext context) {
 AppLocalizations appLocalizations = AppLocalizations.of(context)!;
   return [
  ProductModel(image: AppAssets.shirt, name: appLocalizations.product_name, description: appLocalizations.product_description, price: 400, rating: 4),
  ProductModel(image: AppAssets.shirt, name:  appLocalizations.product_name, description: appLocalizations.product_description, price: 400, rating: 4),
  ProductModel(image: AppAssets.shirt, name:  appLocalizations.product_name, description: appLocalizations.product_description, price: 400, rating: 4),
  ProductModel(image: AppAssets.shirt, name:  appLocalizations.product_name, description: appLocalizations.product_description, price: 250, rating: 5),
    ];
  }
}