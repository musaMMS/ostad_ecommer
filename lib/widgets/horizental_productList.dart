
import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/data/models/product_model.dart';
import 'package:ostad_ecommerce/widgets/product_card.dart';

class HorijentalProductList extends StatelessWidget {
  const HorijentalProductList({

    super.key,
     required this.productList
  });
   final List<ProductModel> productList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return
          ProductCard(
            product: productList[index],
          );
      }, separatorBuilder: (_, __) => SizedBox(width: 8,),
    );
  }
}
