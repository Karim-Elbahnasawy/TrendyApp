import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_assets.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/widgets/custom_products_grid_view.dart';
import 'package:trendy_app/core/widgets/custom_text_form_field.dart';
import 'package:trendy_app/features/main_layout/tabs/home_tab/category_item.dart';
import 'package:trendy_app/features/main_layout/tabs/home_tab/offer_item.dart';
import 'package:trendy_app/models/offer_model.dart';
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
                Center(
                  child: SvgPicture.asset(
                    AppAssets.logo,
                    width: 60.w,
                    height: 60.h,
                    fit: BoxFit.cover,
                  ),
                ),
                CustomTextFormField(
                  hintText: appLocalizations.search_for_any_product,
                  prefixIcon: Icon(Icons.search),
                ),
                Text(appLocalizations.all_categories,style: textTheme.labelMedium),
                SizedBox(
                  height: 110,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      CategoryItem(text: appLocalizations.kids,image: AppAssets.kids),
                      SizedBox(width: 15.w),
                      CategoryItem(text: appLocalizations.mens,image: AppAssets.mens),
                      SizedBox(width: 15.w),
                      CategoryItem(text: appLocalizations.womens,image: AppAssets.womens),
                      SizedBox(width: 15.w),
                      CategoryItem(text: appLocalizations.shoses,image: AppAssets.shooses),
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
                CustomProductsGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
