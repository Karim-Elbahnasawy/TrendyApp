import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/core/widgets/custom_product_item.dart';
import 'package:trendy_app/providers/cart_provider.dart';

class CartProductsGridView extends StatelessWidget {
  const CartProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: cartProvider.cartProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 6,
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        childAspectRatio: 0.53,
      ),
      itemBuilder: (context, index) =>
          CustomProductItem(productModel: cartProvider.cartProducts[index]),
    );
  }
}
