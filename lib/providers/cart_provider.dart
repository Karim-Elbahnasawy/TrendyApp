import 'package:flutter/material.dart';
import 'package:trendy_app/models/product_model.dart';

class CartProvider extends ChangeNotifier {
  List<ProductModel> cartProducts = [];

  void addToCart(ProductModel product) {
    if (cartProducts.contains(product)) {
      cartProducts.remove(product);
    } else {
      cartProducts.add(product);
    }
    notifyListeners();
  }
}
