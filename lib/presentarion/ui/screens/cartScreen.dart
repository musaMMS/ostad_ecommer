import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/import.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/assets_path.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:ostad_ecommerce/widgets/cart.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _WishlistscreenState();
}

class _WishlistscreenState extends State<CartScreen> {
 late TextTheme textTheme = Theme.of(context).textTheme;
  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value){
        backToHome();

      },
      canPop: false,
      child: Scaffold(
        backgroundColor:Colors.grey.shade100 ,
        appBar: AppBar(
          title: Text('Product'),
          leading: IconButton(onPressed: (){
            backToHome();
          },
              icon:Icon(Icons.arrow_back)),
        ),
        body:Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context,index){
               return CartItem(textTheme: textTheme);
            },
                itemCount: 4,
              ),
            ),
            _buildPriceAndAddToCartSection(),
            Column(

            ),
          ],
        )
      ),
    );
  }
  void backToHome(){
    Get.find<BottomNavBarController>().backToHome();
  }
  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total Price',

              ),
              Text('\$1oo',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),),
            ],
          ),
          SizedBox(
            width: 140,
            child: ElevatedButton(onPressed: (){},

                child:Text('Checkout') ),
          )
        ],
      ),
    );
  }
}


