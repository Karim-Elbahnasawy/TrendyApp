import 'package:flutter/material.dart';
import 'package:trendy_app/models/product_model.dart';

class HomeProvider extends ChangeNotifier {
  List<ProductModel> filteredHomeProducts = ProductModel.products;
  List<ProductModel> homeProducts = ProductModel.products;
  void filterHomeProductsBySearchKey(String searchKey) {
    homeProducts = filteredHomeProducts
        .where(
          (productItem) =>
              productItem.name.toUpperCase().contains(searchKey.toUpperCase()),
        )
        .toList();
    notifyListeners();
  }
}
