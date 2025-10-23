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

  static List<ProductModel> products = [
    ProductModel(
      image: AppAssets.shirt,
      name: 'T_Shirt',
      description:
          'Material is cotton and one of the best seller item and provided from it 3 colors (red , black , blue)',
      price: 400,
      rating: 4,
    ),
    ProductModel(
      image: AppAssets.shirt,
      name: 'Shirt',
      description:
          'Material is cotton and one of the best seller item and provided from it 3 colors (red , black , blue)',
      price: 400,
      rating: 4,
    ),
    ProductModel(
      image: AppAssets.shirt,
      name: 'Skert',
      description:
          'Material is water prof and one of the best seller item and provided from it 3 colors (red , black , red)',

      price: 400,
      rating: 4,
    ),
    ProductModel(
      image: AppAssets.shirt,
      name: 'Pantalon',
      description:
          'Material is water prof and one of the best seller item and provided from it 3 colors (red , black , red)',
      price: 400,
      rating: 4,
    ),
  ];
}
