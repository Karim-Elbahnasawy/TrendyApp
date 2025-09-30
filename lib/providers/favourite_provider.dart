import 'package:flutter/material.dart';
import 'package:trendy_app/models/product_model.dart';

class FavouriteProvider extends ChangeNotifier {
  List<ProductModel> favouriteProducts = [];

  void addToFavourite(ProductModel product) {
    if (favouriteProducts.contains(product)) {
      favouriteProducts.remove(product);
    } else {
      favouriteProducts.add(product);
    }
    notifyListeners();
  }
}