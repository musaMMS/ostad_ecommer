import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/widgets/product_card.dart';

class Productlistscreen extends StatelessWidget {
  const Productlistscreen({super.key, required categoryModel});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (value){
        backToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Product'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                  ),
            itemCount: 20,
            itemBuilder:(context,index){
                // return FittedBox(child: ProductCard());
            },
          ),
        ),
      ),
    );
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
}
