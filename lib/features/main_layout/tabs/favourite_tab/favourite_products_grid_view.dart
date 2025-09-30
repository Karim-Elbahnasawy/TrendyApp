import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/core/widgets/custom_product_item.dart';
import 'package:trendy_app/providers/favourite_provider.dart';

class FavouriteProductsGridView extends StatelessWidget {
  const FavouriteProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final FavouriteProvider favouriteProvider = Provider.of<FavouriteProvider>(context);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: favouriteProvider.favouriteProducts.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisSpacing: 6,
        crossAxisCount: 2,
        mainAxisSpacing: 6,
        childAspectRatio: 0.53,
      ),
      itemBuilder: (context, index) => CustomProductItem(
        productModel: favouriteProvider.favouriteProducts[index],
      ),
    );
  }
}
