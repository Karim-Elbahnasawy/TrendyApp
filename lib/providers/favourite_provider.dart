import 'package:flutter/material.dart';
import 'package:trendy_app/models/product_model.dart';

class FavouriteProvider extends ChangeNotifier {
  List<ProductModel> favouriteProducts = [];
  List<ProductModel> filteredFavouriteProducts = [];

  void addToFavourite(ProductModel product) {
    if (favouriteProducts.contains(product)) {
      favouriteProducts.remove(product);
    } else {
      favouriteProducts.add(product);
    }
    filteredFavouriteProducts = favouriteProducts;
    notifyListeners();
  }

  void filterFavouriteProductsBySearchKey(String searchKey) {
    filteredFavouriteProducts = favouriteProducts
        .where(
          (favouriteItem) => favouriteItem.name.toUpperCase().contains(
            searchKey.toUpperCase(),
          ),
        )
        .toList();
    notifyListeners();
  }
}
