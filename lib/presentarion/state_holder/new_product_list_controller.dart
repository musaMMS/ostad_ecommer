
import 'package:get/get.dart';
import 'package:ostad_ecommerce/data/models/network_response.dart';
import 'package:ostad_ecommerce/data/models/product_list_model.dart';
import 'package:ostad_ecommerce/data/models/product_model.dart';
import 'package:ostad_ecommerce/data/services/network_caller.dart';
import 'package:ostad_ecommerce/data/utils/urls.dart';

class NewProductListController extends GetxController {
  bool _inProgress = false;

  bool get inProgress => _inProgress;

  List<ProductModel> _productList = [];

  List<ProductModel> get productList => _productList;

  String? _errorMessage;

  String? get errorMessage => _errorMessage;

  Future<bool> getNewProductList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final NetworkResponse response = await Get.find<NetworkCaller>().getResult(
      url: Urls.productListByRemark('new'),
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