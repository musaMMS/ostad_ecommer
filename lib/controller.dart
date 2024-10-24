import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:ostad_ecommerce/data/services/network_caller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/bottom_nav_bar_controller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/categoryList_controller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/new_product_list_controller.dart';
import 'package:ostad_ecommerce/presentarion/state_holder/sliderList_controller.dart';


class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomNavBarController());
    Get.put(Logger());
    Get.put(NetworkCaller(logger: Get.find<Logger>()));
    Get.put(SliderListController());
    Get.put( CategoryListController());
    Get.put( NewProductListController());
  }
}
