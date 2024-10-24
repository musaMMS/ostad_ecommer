import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/assets_path.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.textTheme,
  });

  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      color: Colors.white,
      child:Row(
        children: [
          _buildProductImage(),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child:Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Text('Titke of Product' ,
                            style:textTheme.bodyLarge,
                          ),
                          _buildColorAndSize(),
                        ],
                      ),
                    ),
                    IconButton(onPressed: (){},
                        icon: Icon(Icons.delete,color:Colors.black54 ,)
                    ),
                  ],
                ),
                _buildPriceCounter(),
              ],
            ),
          )
        ],
      ) ,
    );
  }

  Widget _buildColorAndSize() {
    return Wrap(
                          spacing: 8,
                          children: [
                            Text(
                              'Color Red' ,
                              style:textTheme.bodySmall?.copyWith(
                                  color: Colors.grey
                              ),
                            ),
                            Text(
                              'Size XL' ,
                              style:textTheme.bodySmall?.copyWith(
                                  color: Colors.grey
                              ),
                            ),
                          ],
                        );
  }

  Widget _buildPriceCounter() {
    return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('\$100',style: textTheme.titleMedium?.copyWith(
                    color: AppColors.themeColor,
                  ),),
                  ItemCount(
                    initialValue: 1,
                    minValue: 0,
                    maxValue: 20,
                    decimalPlaces: 0,
                    color: AppColors.themeColor,
                    onChanged: (value) {
                      // Handle counter value changes

                    },
                  ),

                ],
              );
  }

  Widget _buildProductImage() {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AssetsPath.demmyshoe,
            height: 60,
            width: 60,
            fit: BoxFit.scaleDown,
          ),
        );
  }
}