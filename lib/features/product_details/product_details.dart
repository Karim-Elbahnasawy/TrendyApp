import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/widgets/custom_elvated_button.dart';
import 'package:trendy_app/features/main_layout/tabs/profile_tab/profile_tab.dart';
import 'package:trendy_app/models/product_model.dart';
import 'package:trendy_app/providers/cart_provider.dart';
import 'package:trendy_app/providers/favourite_provider.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.productModel});

  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final CartProvider cartProvider = Provider.of<CartProvider>(context);
    final FavouriteProvider favouriteProvider = Provider.of<FavouriteProvider>(context);
    final bool isFavourite = favouriteProvider.favouriteProducts.contains( productModel);
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
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          // gradient: LinearGradient(
          //   begin: Alignment.topCenter,
          //   end: Alignment.bottomCenter,
          //   colors: [
          //     Theme.of(context).primaryColor,
          //     Theme.of(context).primaryColorDark,
          //   ],
          // ),
        ),
        child: Padding(
          padding: REdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16.r),
                child: Center(
                  child: Image.asset(
                    productModel.image,
                    height: 300.h,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Text(
                productModel.name,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              
           SizedBox(height: 20.h),
              Text(
                maxLines: 4,
                productModel.description,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
               SizedBox(height: 20.h),
                  Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    
                    productModel.rating.toString(),
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Icon(Icons.star_half,color: Colors.amber,size: 28,),
                ],
              ),
               
              SizedBox(height: 20.h),
              Row(
                children: [
                  CustomElvatedButtonRow(appLocalizations: appLocalizations, text:'${appLocalizations.buy_now} ${productModel.price}', icon: Icons.attach_money, onPressed: (){
                    
                  }),
                  SizedBox(width: 10.w,),
                    CustomElvatedButtonRow(appLocalizations: appLocalizations, text:appLocalizations.add_to_cart, icon: Icons.add_shopping_cart_outlined, onPressed: (){
                       cartProvider.addToCart(productModel);
                    
                  }),
                ],
              ),
SizedBox(height: 20.h,),
               SizedBox(
                height: 60,
                 child: CustomElvatedButtonRow(appLocalizations: appLocalizations, text:'Add To Favourite', icon: Icons.favorite_outline, onPressed: (){
                         favouriteProvider.addToFavourite(productModel);
                      
                    }),
               ),
              
            // //  Spacer(flex: 2),
            //   SizedBox(
            //     width: double.infinity,
            //     child: CustomElvatedButton(
            //       text: '${appLocalizations.buy_now} ${productModel.price}',
            //       onPressed: () {},
            //     ),
            //   ),
            //   //Spacer(flex: 1),
            //   SizedBox(
            //     width: double.infinity,
            //     child: CustomElvatedButton(
            //       text: appLocalizations.add_to_cart,
            //       onPressed: () {
            //           cartProvider.addToFavourite(productModel);
            //       },
            //     ),
            //   ),
              //Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
