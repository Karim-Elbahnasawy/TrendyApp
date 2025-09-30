import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/models/product_model.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({super.key, required this.productModel});

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,AppRoutes.productDetails,arguments: productModel);
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
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
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
                  Icon(Icons.star_outline, color: Colors.amber),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
