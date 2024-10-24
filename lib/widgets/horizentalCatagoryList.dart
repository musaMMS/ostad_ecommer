import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/data/models/category_model.dart';
import 'package:ostad_ecommerce/widgets/catagoryCard.dart';

class HorizentalCatagorylist extends StatelessWidget {
  const HorizentalCatagorylist({
    super.key, required this.categoryList,
  });

final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: categoryList.length,
      itemBuilder:(context,index){
        return CatagoryCard(
            categoryModel:categoryList[index]);
      },
      separatorBuilder:(_, __) => SizedBox(width: 8,),
    );
  }
}

