import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/data/models/product_model.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/productDatailsScreen.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/assets_path.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> ProductDatilsScreen());
      },
      child: Card(
        elevation: 3,
        child: SizedBox(
          width: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 90,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.themeColor.withOpacity(0.1),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  image: DecorationImage(image: AssetImage(AssetsPath.demmyshoe),
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              Padding(
                padding:EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(product.title??'',
                      maxLines:1,
                      // style:Theme.of(context).textTheme.bodyLarge,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: FittedBox(
                            child: Text('\$${product.price}',style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: AppColors.themeColor,
                            ),
                            ),
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                            Text('${product.star}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Card(
                          color: AppColors.themeColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Padding(padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.favorite_border_rounded,size: 16,color: Colors.white,),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}