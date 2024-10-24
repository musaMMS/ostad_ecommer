import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/categoryList_controller.dart';
import 'package:ostad_ecommerce/widgets/catagoryCard.dart';
import 'package:ostad_ecommerce/widgets/centred_circulur_prograss_indecator.dart';

class CategoryListScreen extends StatelessWidget {
  const CategoryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backToHome();
        return false; // Prevent default back action
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          leading: IconButton(
            onPressed: backToHome,
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Get.find<CategoryListController>().getCategoryList();
          },
          child: GetBuilder<CategoryListController>(
            builder: (categoryListController) {
              if (categoryListController.inProgress) {
                return const CentredCirculurPrograssIndecator(); // Loading state
              } else if (categoryListController.errorMessage != null) {
                return Center(
                  child: Text(categoryListController.errorMessage!), // Error message
                );
              } else if (categoryListController.categoryList.isEmpty) {
                return const Center(
                  child: Text('No categories found.'), // Empty state
                );
              }

              // Grid view of categories
              return GridView.builder(
                itemCount: categoryListController.categoryList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return CatagoryCard(
                    categoryModel: categoryListController.categoryList[index],
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  void backToHome() {
    Get.find<BottomNavBarController>().backToHome();
  }
}
