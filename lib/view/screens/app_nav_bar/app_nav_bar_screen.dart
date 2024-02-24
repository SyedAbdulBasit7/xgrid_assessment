import 'package:ecommerce_app/utils/app_constants/app_colors.dart';
import 'package:ecommerce_app/view/screens/bag/bag_screen.dart';
import 'package:ecommerce_app/view/screens/brands/brands_screen.dart';
import 'package:ecommerce_app/view/screens/categories/categories_Screen.dart';
import 'package:ecommerce_app/view/screens/my_account/my_account_screen.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_theme/app_text_style.dart';
import '../../widgets/svg_custom_icon.dart';
import '../home/home_screen.dart';

class AppNavBarScreen extends StatefulWidget {
  static const routeName = '/app-nav-bar-screen';

  const AppNavBarScreen({Key? key}) : super(key: key);

  @override
  State<AppNavBarScreen> createState() => _AppNavBarScreenState();
}

class _AppNavBarScreenState extends State<AppNavBarScreen> {
  int _selectedIndex = 0;
  final List<Widget> navBarItems = [
    const HomeScreen(),
    const CategoriesScreen(),
    const BrandScreen(),
    const BagScreen(),
    const MyAccountScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navBarItems.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: AppColors.primary,
          onTap: _onItemTapped,
          currentIndex: _selectedIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.white,
          unselectedItemColor: AppColors.greyText,
          selectedLabelStyle: AppTextStyle.semiBold13,
          unselectedLabelStyle: AppTextStyle.semiBold13,
          items: [
            BottomNavigationBarItem(
                activeIcon: _activeIcon('AppImages.homeNav'),
                icon: _selectedIcon('AppImages.homeNav'),
                label: 'Home'),
            BottomNavigationBarItem(
              activeIcon: _activeIcon('CategoriesImage'),
              icon: _selectedIcon('CategoriesImage'),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              activeIcon: _activeIcon('BrandImage'),
              icon: _selectedIcon('BrandImage'),
              label: 'Brands',
            ),
            BottomNavigationBarItem(
              activeIcon: _activeIcon('BagsImage'),
              icon: _selectedIcon('BagsImage'),
              label: 'Bags',
            ),
              BottomNavigationBarItem(
              activeIcon: _activeIcon('MyAccountImage'),
              icon: _selectedIcon('MyAccountImage'),
              label: 'My Account',
            ),
          ],
        ),
    );
  }

  Widget _activeIcon(String icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 4),
      child: SvgCustomIcon(
        svgIcon: icon,
      ),
    );
  }

  Widget _selectedIcon(String icon) {
    return Padding(
      padding: const EdgeInsets.only(top: 6, bottom: 4),
      child: SvgCustomIcon(
        svgIcon: icon,
        iconColor: const ColorFilter.mode(AppColors.greyText, BlendMode.srcIn),
      ),
    );
  }
}
