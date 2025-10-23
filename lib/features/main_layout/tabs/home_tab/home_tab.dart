import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/utils/app_constants.dart';
import 'package:trendy_app/core/widgets/custom_icon.dart';
import 'package:trendy_app/features/main_layout/tabs/home_tab/all_products_grid_view.dart';
import 'package:trendy_app/core/widgets/custom_text_form_field.dart';
import 'package:trendy_app/features/main_layout/tabs/home_tab/category_item.dart';
import 'package:trendy_app/features/main_layout/tabs/home_tab/offer_item.dart';
import 'package:trendy_app/models/offer_model.dart';
import 'package:trendy_app/providers/home_provider.dart';
import 'package:trendy_app/providers/language_provider.dart';
import 'package:trendy_app/providers/theme_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    final TextTheme textTheme = Theme.of(context).textTheme;
      CarouselSliderController? carouselController = CarouselSliderController();
   final HomeProvider homeProvider = Provider.of<HomeProvider>(context);
    final ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    final LanguageProvider languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      color: Theme.of(context).primaryColor,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.symmetric(horizontal: 16),
            child: Column(
              spacing: 16.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                   Row(
              
               children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(appLocalizations.welcome_Back,style:textTheme.labelMedium?.copyWith(fontSize: 18),),
                  Text('Karim Gamal',style: textTheme.labelMedium?.copyWith(fontSize: 18),)
                ],
              ),
              Spacer(),
                CustomIcon(
                onPressed: () {
                  languageProvider.currentLanguage == AppConstants.english
                      ? languageProvider.changeAppLanguage(AppConstants.arabic)
                      : languageProvider.changeAppLanguage(AppConstants.english);
                },
                icon: Icons.language,
              ),
               
               
                               CustomIcon(
                onPressed: () {
                  themeProvider.currentTheme == ThemeMode.light
                      ? themeProvider.changeAppTheme(ThemeMode.dark)
                      : themeProvider.changeAppTheme(ThemeMode.light);
                },
                icon: themeProvider.isDark ? Icons.dark_mode : Icons.light_mode,
              ),
               ],
             ),
                CustomTextFormField(
                  onChanged: (input){
                 homeProvider.filterHomeProductsBySearchKey(input);
                 
                  },
                  hintText: appLocalizations.search_for_any_product,
                  prefixIcon: Icon(Icons.search),
                ),
                Text(
                  appLocalizations.all_categories,
                  style: textTheme.labelMedium,
                ),
                SizedBox(
                  height: 110.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItem(
                        text: appLocalizations.kids,
                        image: AppAssets.kids,
                      ),
                      SizedBox(width: 15.w),
                      CategoryItem(
                        text: appLocalizations.mens,
                        image: AppAssets.mens,
                      ),
                      SizedBox(width: 15.w),
                      CategoryItem(
                        text: appLocalizations.womens,
                        image: AppAssets.womens,
                      ),
                      SizedBox(width: 15.w),
                      CategoryItem(
                        text: appLocalizations.shoses,
                        image: AppAssets.shooses,
                      ),
                    ],
                  ),
                ),
                CarouselSlider(
                  carouselController: carouselController,
                  items: OfferModel.offers(
                    context,
                  ).map((item) => OfferItem(offersModel: item)).toList(),
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        activeIndex = index;
                      });
                    },
                    autoPlay: true,
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    viewportFraction: 1,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AnimatedSmoothIndicator(
                    effect: WormEffect(
                      activeDotColor: AppColors.pink,
                      dotColor: AppColors.grey,
                    ),
                    activeIndex: activeIndex,
                    count: OfferModel.offers(context).length,
                  ),
                ),
                AllProductsGridView(),
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
