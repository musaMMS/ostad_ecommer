import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/data/models/category_model.dart';
import 'package:ostad_ecommerce/import.dart';
import 'package:ostad_ecommerce/presentarion/ui/screens/productListScreen.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';

class CatagoryCard extends StatelessWidget {
  const CatagoryCard({
    super.key, required this.categoryModel,
  });

final CategoryModel categoryModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(()=> Productlistscreen (
            categoryModel:categoryModel.categoryName?? '' ));
      },
      child: Column(
        children: [
          Container(
            padding:EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.2),
            ),
            child: Icon(Icons.computer,
              size: 48,
              color: AppColors.themeColor,
            ),
          ),
          Text(categoryModel.categoryName??'',
            style: TextStyle(
              color: AppColors.themeColor,
            ),
          ),
        ],
      ),
    );
  }
}