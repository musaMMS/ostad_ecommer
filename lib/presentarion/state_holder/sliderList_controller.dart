import 'package:ostad_ecommerce/data/models/network_response.dart';
import 'package:ostad_ecommerce/data/models/slider_list_model.dart';
import 'package:ostad_ecommerce/data/models/slider_model.dart';
import 'package:ostad_ecommerce/data/services/network_caller.dart';
import 'package:ostad_ecommerce/data/utils/urls.dart';
import 'package:ostad_ecommerce/import.dart';

class SliderListController extends GetxController{
  bool _inPrograss =false;

  String ? _errorMessage;
  List <SliderModel>  _sliderList = [];

  String? get errorMessage => _errorMessage;
  bool get inProgress => _inPrograss;

  List <SliderModel>  get sliders => _sliderList;

  Future <bool> getSliderList()async{
    bool isSuccess =false;
    _inPrograss =true;
    update();
    final NetworkResponse response=await Get.find<NetworkCaller>().getResult(url: Urls.sliderListUrl);
    if(response.isSuccess){

       isSuccess=true;
      _errorMessage =null;
      _sliderList = SliderListModel.fromJson(response.responseData).sliderList?? [];

    }else{
      _errorMessage =response.errorMessage;

    }
    _inPrograss =false;
     update();
    return isSuccess;

  }
}