import 'package:flutter/material.dart';
import 'package:ostad_ecommerce/import.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/sliderList_controller.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ostad_ecommerce/widgets/centred_circulur_prograss_indecator.dart';

class HomeBannerSlider extends StatefulWidget {
  const HomeBannerSlider({
    super.key,
  });

  @override
  State<HomeBannerSlider> createState() => _HomeBannerSliderState();
}
class _HomeBannerSliderState extends State<HomeBannerSlider> {
  final ValueNotifier<int>_selectedIndex =ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SliderListController>(
      builder: (sliderListController) {
        return Visibility(
          visible: !sliderListController.inProgress,
          replacement: SizedBox(
            height: 192,
            child: CentredCirculurPrograssIndecator(),
          ),
          child: Column(
            children: [
              _buildCarouselSlider(sliderListController),
                const SizedBox(height: 8,),
                _builderCarouseldots(sliderListController)
            ],
          ),
        );
      }
    );

  }

  Widget _buildCarouselSlider(SliderListController sliderListController) {
    return CarouselSlider(
              options: CarouselOptions(
                  height: 180.0,
                  viewportFraction: 0.9,
                  onPageChanged: (index,reason){
                _selectedIndex.value=index;
              }),
              items: sliderListController.sliders.map((slider) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.circular(8)
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          children: [
                             Placeholder(
                                fallbackHeight: 100,
                                fallbackWidth: 100,
                              ),
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(slider.price??'',
                                      textAlign: TextAlign.center,
                                      style: Theme.of(context).textTheme.titleLarge?.
                                      copyWith(
                                    color: Colors.white,fontWeight:FontWeight.w600,
                                  )),
                                SizedBox(height:16 ,),
                                SizedBox(
                                  width: 100,
                                  child: ElevatedButton(

                                      style:ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: AppColors.themeColor,
                                      ),
                                      onPressed: (){},
                                      child: Text('Buy now')),
                                )
                                ],
                              ),
                            )

                          ],
                        )
                    );
                  },
                );
              }).toList(),
            );
  }

Widget _builderCarouseldots(SliderListController sliderListController) {
    return ValueListenableBuilder(
                valueListenable: _selectedIndex,
                builder: (context,currentIndex,_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (int i=0;i<sliderListController.sliders.length;i++)
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
              );
  }
  @override
  void dispose() {
    _selectedIndex.dispose();
    super.dispose();
  }
}