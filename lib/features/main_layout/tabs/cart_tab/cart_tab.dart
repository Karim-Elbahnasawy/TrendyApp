import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/widgets/custom_icon.dart';
import 'package:trendy_app/core/widgets/custom_text_form_field.dart';
import 'package:trendy_app/features/main_layout/tabs/cart_tab/cart_products_grid_view.dart';
import 'package:trendy_app/providers/cart_provider.dart';
import 'package:trendy_app/providers/favourite_provider.dart';
class CartTab extends StatelessWidget {
  const CartTab({super.key});

  @override
  Widget build(BuildContext context) {
        AppLocalizations appLocalizations = AppLocalizations.of(context)!;

     final CartProvider cartProvider = Provider.of<CartProvider>(
      context,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      child: cartProvider.cartProducts.isEmpty ? Column(
        children: [
           Spacer(flex: 5,),
              // Lottie.asset(
              // 'assets/animations/shopping_cart.json'),
              Image.asset(AppAssets.cart,width: double.infinity,height: 350,),
               Spacer(flex: 1,),
        
              Text(appLocalizations.no_items_cart,style: Theme.of(context).textTheme.labelMedium,),
            Spacer(flex: 4,),
            
        ],
      ): SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding: REdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  spacing: 16.h,
                  children: [
                    SvgPicture.asset(
                      AppAssets.logo,
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    //  CustomTextFormField(
                    //     onChanged: (input) {
                          
                    //     },
                    //     prefixIcon: Icon(Icons.search),
                    //     hintText: appLocalizations.search_for_any_product,
                    //   ),
                    //  CartProductsGridView(),
                    Card(
                      elevation: 5,
                      child: Row(
                        children: [
                          Image.asset(AppAssets.shirt),
                          Column(
                            children: [
                              Text('hhh',style: Theme.of(context).textTheme.headlineSmall,),
                      
                              Text('price',style:  Theme.of(context).textTheme.headlineSmall),
                             IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                      
                            ],
                          ),
                          Spacer(),
                       Column(
                      //  mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){}, icon: Icon(Icons.add)),
                            Text('1',style:  Theme.of(context).textTheme.headlineSmall),
                            IconButton(onPressed: (){}, icon: Icon(Icons.remove))
                        ],
                       ),
                       
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h,),
                       
                  ],
                ),
              ),
            ),
          ),
    );
  }
}