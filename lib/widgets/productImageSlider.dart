import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/assets_path.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({
    super.key,
  });

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}
class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int>_selectedIndex =ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 180.0,
              onPageChanged: (index,reason){
            _selectedIndex.value=index;

          },
            viewportFraction: 1,

          ),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    image: DecorationImage(
                      image: AssetImage(AssetsPath.demmyshoe
                    ),
                  ),
                  )
                  );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 8,),
        Positioned(
          left:0 ,
          right: 0,
          bottom: 8,
          child: ValueListenableBuilder(
              valueListenable: _selectedIndex,
              builder: (context,currentIndex,_) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i=0;i<5;i++)
                      Container(
                        height:12 ,
                        width: 12,
                        margin: EdgeInsets.only(right: 4),
                        decoration: BoxDecoration(
                            color: currentIndex==i ? AppColors.themeColor:null,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey)
                        ),
                      ),
                  ],
                );
              }
          ),
        )
      ],
    );

  }
  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}