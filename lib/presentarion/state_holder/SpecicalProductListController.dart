import 'package:ostad_ecommerce/data/models/product_model.dart';
import 'package:ostad_ecommerce/import.dart';

import '../../data/models/network_response.dart';
import '../../data/models/product_list_model.dart';
import '../../data/services/network_caller.dart';
import '../../data/utils/urls.dart';

class SpecialProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getSpecialProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getResult(
      url: Urls.productListByRemark('special'),
    );

    if (response.isSuccess) {
      _productList =
          ProductListModel.fromJson(response.responseData).productList ?? [];
      isSuccess = true;
      _errorMessage = null;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}