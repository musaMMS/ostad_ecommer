import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/categoryList_controller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/new_product_list_controller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/sliderList_controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/cartScreen.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/home_screnn.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/wishlistScreen.dart';

import 'CatagoryScreen.dart';

class ManinButtonNavScreen extends StatefulWidget {
  const ManinButtonNavScreen({super.key});

  @override
  State<ManinButtonNavScreen> createState() => _ManinButtonNavScreenState();
}

class _ManinButtonNavScreenState extends State<ManinButtonNavScreen> {
  final BottomNavBarController _navBarController = Get.find<BottomNavBarController>();

  final List<Widget> _screens =[
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    Wishlistscreen(),
  ];
  @override
  void initState() {
    super.initState();
    Get.find<SliderListController>().getSliderList();
    Get.find<CategoryListController>().getCategoryList();
    Get.find<NewProductListController>().getNewProductList();
  }

  @override
  Widget build(BuildContext context) {
    return  GetBuilder<BottomNavBarController>(
      builder: (_) {
        return Scaffold(
          body: _screens[_navBarController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex:_navBarController.selectedIndex,
             onDestinationSelected: _navBarController.changeIndex,
             destinations: const[
               NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
               NavigationDestination(icon: Icon(Icons.category_outlined), label: 'Category'),
               NavigationDestination(icon: Icon(Icons.shopping_cart), label: 'Cart'),
               NavigationDestination(icon: Icon(Icons.favorite_border), label: 'Wishlist'),
             ],
              ),
        );
      }
    );
  }
}
