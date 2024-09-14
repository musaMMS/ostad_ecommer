import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:carousel_slider/carousel_slider.dart';

class carsolSlider extends StatefulWidget {
  const carsolSlider({
    super.key,
  });

  @override
  State<carsolSlider> createState() => _carsolSliderState();
}
class _carsolSliderState extends State<carsolSlider> {
  final ValueNotifier<int>_selectedIndex =ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(height: 180.0,onPageChanged: (index,reason){
            _selectedIndex.value=index;
          }),
          items: [1,2,3,4,5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                    ),
                    alignment: Alignment.center,
                    child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                );
              },
            );
          }).toList(),
        ),
          const SizedBox(height: 8,),
          ValueListenableBuilder(
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