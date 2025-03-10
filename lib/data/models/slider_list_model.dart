import 'package:ostad_ecommerce/data/models/slider_model.dart';

class SliderListModel {
  String? msg;
  List<SliderModel>? sliderList;

  SliderListModel({this.msg, this.sliderList});

  SliderListModel.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    if (json['data'] != null) {
      sliderList = <SliderModel>[];
      json['data'].forEach((v) {
        sliderList!.add(new SliderModel.fromJson(v));
      });
    }
  }
}


