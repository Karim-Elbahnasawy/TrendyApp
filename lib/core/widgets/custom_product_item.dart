import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/models/product_model.dart';
import 'package:trendy_app/providers/favourite_provider.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final FavouriteProvider favouriteProvider = Provider.of<FavouriteProvider>(context);
    final bool isFavourite = favouriteProvider.favouriteProducts.contains( productModel);
     return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.productDetails,
          arguments: productModel,
        );
      },
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: REdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.asset(
                  productModel.image,
                  width: 160.w,
                  height: 160.h,
                  fit: BoxFit.cover,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(productModel.name, style: textTheme.headlineMedium),
                  IconButton(
                    onPressed: () {
                      favouriteProvider.addToFavourite(productModel);
                    },
                    icon: isFavourite
                        ? Icon(Icons.favorite, color: AppColors.red)
                        : Icon(Icons.favorite_border_outlined),
                  ),
                ],
              ),
              Text(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                productModel.description,
                style: textTheme.displaySmall,
              ),
              SizedBox(height: 8.h),
              Text(
                productModel.price.toString(),
                style: textTheme.headlineMedium,
              ),
              SizedBox(height: 8.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productModel.rating.toString(),
                    style: textTheme.displaySmall,
                  ),
                  SizedBox(width: 5.w),
                  Icon(Icons.star_half, color: Colors.amber,size: 25,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
