import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/core/widgets/custom_product_item.dart';
import 'package:trendy_app/models/product_model.dart';
import 'package:trendy_app/providers/favourite_provider.dart';
import 'package:trendy_app/providers/home_provider.dart';

class AllProductsGridView extends StatelessWidget {
  const AllProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
   final HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: homeProvider.homeProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 6,
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        childAspectRatio: 0.53,
      ),
      itemBuilder: (context, index) => CustomProductItem(
        productModel: homeProvider.homeProducts[index],
      ),
    );
  }
}
