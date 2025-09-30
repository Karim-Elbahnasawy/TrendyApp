import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendy_app/config/language/app_localizations.dart';
import 'package:trendy_app/core/utils/app_colors.dart';
import 'package:trendy_app/features/main_layout/tabs/cart_tab/cart_tab.dart';
import 'package:trendy_app/features/main_layout/tabs/favourite_tab/favourite_tab.dart';
import 'package:trendy_app/features/main_layout/tabs/home_tab/home_tab.dart';
import 'package:trendy_app/features/main_layout/tabs/profile_tab/profile_tab.dart';
import 'package:trendy_app/providers/favourite_provider.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  List<Widget> tabs = [HomeTab(), FavouriteTab(), CartTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteProvider(),
      child: Scaffold(
        body: tabs[_selectedIndex],
        bottomNavigationBar: _buildNavBar(),
      ),
    );
  }

  void _onIconClicked(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavBar() {
    final AppLocalizations appLocalizations = AppLocalizations.of(context)!;
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onIconClicked,
        items: [
          BottomNavigationBarItem(
            icon: _selectedIndex == 0
                ? CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.pink,
                    child: Icon(
                      size: 28,
                      Icons.home_outlined,
                      color: AppColors.white,
                    ),
                  )
                : Icon(
                    size: 28,
                    Icons.home_outlined,
                    color: Theme.of(context).primaryColorDark,
                  ),
            label: appLocalizations.home,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 1
                ? CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.pink,
                    child: Icon(
                      Icons.favorite_outline,
                      size: 28,
                      color: AppColors.white,
                    ),
                  )
                : Icon(
                    Icons.favorite_outline,
                    size: 28,
                    color: Theme.of(context).primaryColorDark,
                  ),
            label: appLocalizations.favourite,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 2
                ? CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.pink,
                    child: Icon(
                      size: 28,
                      Icons.shopping_cart_outlined,
                      color: AppColors.white,
                    ),
                  )
                : Icon(
                    size: 28,
                    Icons.shopping_cart_outlined,
                    color: Theme.of(context).primaryColorDark,
                  ),
            label: appLocalizations.cart,
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex == 3
                ? CircleAvatar(
                    radius: 28,
                    backgroundColor: AppColors.pink,
                    child: Icon(
                      size: 28,
                      Icons.person_outline,
                      color: AppColors.white,
                    ),
                  )
                : Icon(
                    size: 28,
                    Icons.person_outline,
                    color: Theme.of(context).primaryColorDark,
                  ),
            label: appLocalizations.profile,
          ),
        ],
      ),
    );
  }
}
