import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/config/prefs/cache_helper.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/core/utils/app_routes.dart';
import 'package:trendy_app/models/on_boarding_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  late final PageController _pageController;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme theme = Theme.of(context).textTheme;
    AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 16),
        child: PageView.builder(
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: _pageController,
          itemCount: OnBoardingModel.onBoardingList(context).length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Spacer(flex: 4),
                SvgPicture.asset(
                  OnBoardingModel.onBoardingList(context)[index].image,
                  width: 310.w,
                  height: 320.h,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 15.h),
                Text(
                  OnBoardingModel.onBoardingList(context)[index].title,
                  style: theme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10.h),
                Text(
                  OnBoardingModel.onBoardingList(context)[index].description,
                  style: theme.titleSmall,
                  textAlign: TextAlign.center,
                ),
                Spacer(flex: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    currentIndex == 2
                        ? TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.login,
                              );
                            },
                            child: Text(
                              appLocalizations.login,
                              style: theme.titleSmall,
                            ),
                          )
                        : TextButton(
                            onPressed: () {
                              CacheHelper.saveOnBoarding();
                              _pageController.jumpToPage(2);
                            },
                            child: Text(
                              appLocalizations.skip,
                              style: theme.titleSmall,
                            ),
                          ),
                    SmoothPageIndicator(
                      effect: WormEffect(
                        activeDotColor: AppColors.primaryColor,
                        dotColor: AppColors.grey,
                        dotHeight: 10.h,
                        dotWidth: 25.w,
                      ),
                      count: 3,
                      controller: _pageController,
                    ),
                    currentIndex == 2
                        ? GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.register,
                              );
                            },
                            child: Container(
                              padding: REdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                appLocalizations.register,
                                style: theme.titleSmall,
                              ),
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              CacheHelper.saveOnBoarding();
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOutCubic,
                              );
                            },
                            child: Container(
                              padding: REdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Text(
                                appLocalizations.next,
                                style: theme.titleSmall,
                              ),
                            ),
                          ),
                  ],
                ),
                Spacer(flex: 1),
              ],
            );
          },
        ),
      ),
    );
  }
}
