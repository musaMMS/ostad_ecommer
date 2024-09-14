import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/app-colors.dart';
import 'package:ostad_ecommerce/presentarion/ui/utils/assets_path.dart';
import 'package:ostad_ecommerce/widgets/AppBarIconButton.dart';
import 'package:ostad_ecommerce/widgets/carcole_slider.dart';
import 'package:ostad_ecommerce/widgets/section_bannar.dart';
import 'package:ostad_ecommerce/widgets/text_field_serach.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:_buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height:16,),
              SearchTextField(textEditingController: TextEditingController(),),
              SizedBox(height: 8,),
              carsolSlider(),
              SizedBox(height: 8,),
              _buildCategoriesSection(),
              SizedBox(height: 8,),
              SectionHeader(
                title:'Popular',
                onTap: () {},
              ),
              SizedBox(
                  height:140 ,
                  child: _buildProductislistView()),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCategoriesSection() {
    return Column(
            children: [
              SectionHeader(
                  title:'Categories',
                  onTap: () {},
              ),
              SizedBox(height: 8,),
              SizedBox(
                height: 120,
                child: _buildCategorislistView(),
              ),
            ],
          );
  }
  Widget _buildProductislistView() {
    return widget(
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return
             Card(
              child: SizedBox(
                width: 120,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 120,
                      height: 100,
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
                    Text('Product Name'),
                    Row(
                      children: [
                        Text('\$120'),
                        Wrap(
                          children: [
                            Icon(Icons.star,color: Colors.amber,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
        }, separatorBuilder: (_, __) => SizedBox(width: 8,),
      ),
    );
  }

  Widget _buildCategorislistView() {
    return ListView.separated(
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder:(context,index){
                  return Column(
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
                      Text('Electornics',
                      style: TextStyle(
                        color: AppColors.themeColor,
                      ),
                      )
                    ],
                  );
                  }, separatorBuilder:(_, __) => SizedBox(width: 8,),
                  );
  }

 AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.appLogoNav),
      actions: [
      AppBarIconButton(
          onTap: (){},
          iconData: Icons.person,
      ),
        SizedBox(width:8 ,),
        AppBarIconButton(
          onTap: (){},
          iconData: Icons.call,
        ),
        SizedBox(width:8 ,),
        AppBarIconButton(
          onTap: (){},
          iconData: Icons.notifications_active_outlined,
        ),
      ],
    );

  }
}







