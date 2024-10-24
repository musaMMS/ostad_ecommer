import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:ostad_ecommerce/widgets/color_picker.dart';
import 'package:ostad_ecommerce/widgets/productImageSlider.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:ostad_ecommerce/widgets/sizepicker.dart';

class ProductDatilsScreen extends StatefulWidget {
  const ProductDatilsScreen({super.key});

  @override
  State<ProductDatilsScreen> createState() => _ProductDatilsScreenState();
}

class _ProductDatilsScreenState extends State<ProductDatilsScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: _bulidProductDetails(),
          ),
          _buildPriceAndAddToCartSection()
        ],
      ),
    );
  }

  Widget _bulidProductDetails() {
    return SingleChildScrollView(
            child: Column(
              children: [
                ProductImageSlider(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildNameAndQuantitSection(),
                      const SizedBox(height: 4,),
                      _buildRatingAndReviewServices(),
                      const SizedBox(height: 8),
                      ColorPiciker(colors:[
                        Colors.red,
                        Colors.green,
                        Colors.yellow,
                        Colors.black,
                      ], onColorSelected: (color){
                      }
                      ),
                      const SizedBox(height: 8,),
                      SizePicker(
                        sizes: [
                          'M',
                          'L',
                          'X',
                          'XXL'
                        ],onSizeSelected: (String selectedSixze) {  },
                      ),
                      _buildDescription(context),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

  Widget _buildNameAndQuantitSection() {
    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: Text('Nike shoe 2024 latest model - New year special deal',
                        style: Theme.of(context).textTheme.titleMedium,
                        )),
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

  Widget _buildRatingAndReviewServices() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [Icon(Icons.star,color: Colors.amber,), Text('3',
            style: TextStyle(fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),
          ),
          ],
        ),
        const SizedBox(width: 8,),
        TextButton(
          onPressed: (){},
                          child: Text(
                            'Reviews',
                            style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.themeColor,
                          ),
                          ),
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
                    );
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
                  Text('Price',

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

                    child:Text('Add to Cart ') ),
              )
            ],
          ),
        );
  }

  Widget _buildDescription(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10,),
        Text('Descpriction',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text('''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum''', style: TextStyle(
          color: Colors.black54,
        ),
        ),
      ],
    );
  }
}

