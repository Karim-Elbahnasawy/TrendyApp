import 'package:flutter/material.dart';
import 'package:trendy_app/core/widgets/custom_product_item.dart';
import 'package:trendy_app/models/product_model.dart';

class CustomProductsGridView extends StatelessWidget {
  const CustomProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: ProductModel.products(context).length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 6,
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        childAspectRatio: 0.53,
      ),
      itemBuilder: (context, index) => CustomProductItem(
        productModel: ProductModel.products(context)[index],
      ),
    );
  }
}
