import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/widgets/custom_elvated_button.dart';
import 'package:trendy_app/models/product_model.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          appLocalizations.product_details,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).primaryColor,
              Theme.of(context).primaryColorDark,
            ],
          ),
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16.r),
                child: Image.asset(
                  productModel.image,
                  height: 300.h,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    productModel.name,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(width: 10.w),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_outline),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Text(
                productModel.description,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 20.h),
              Text(
                productModel.price.toString(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 20.h),
              Text(
                productModel.rating.toString(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Spacer(flex: 2),
              SizedBox(
                width: double.infinity,
                child: CustomElvatedButton(
                  text: '${appLocalizations.buy_now} ${productModel.price}',
                  onPressed: () {},
                ),
              ),
              Spacer(flex: 1),
              SizedBox(
                width: double.infinity,
                child: CustomElvatedButton(
                  text: appLocalizations.add_to_cart,
                  onPressed: () {},
                ),
              ),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
