import 'package:ostad_ecommerce/data/models/category_list_model.dart';
import 'package:ostad_ecommerce/data/models/category_model.dart';
import 'package:ostad_ecommerce/data/models/network_response.dart';
import 'package:ostad_ecommerce/data/services/network_caller.dart';
import 'package:ostad_ecommerce/data/utils/urls.dart';
import 'package:ostad_ecommerce/import.dart';

class CategoryListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  List<CategoryModel> _categoryList = [];

  // Getters for private fields
  String? get errorMessage => _errorMessage;
  List<CategoryModel> get categoryList => _categoryList;

  bool get inProgress => _inProgress;

  // Method to get category list from API
  Future<bool> getCategoryList() async {
    bool isSuccess = false;
    _inProgress = true;
    update(); // Notify listeners that the progress has started

    final NetworkResponse response =
    await Get.find<NetworkCaller>().getResult(url: Urls.categoryListUrl);

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      // Populate category list from the response
      _categoryList = CategoryListModel.fromJson(response.responseData)
          .categoryList ??
          [];
    } else {
      // Handle error and store error message
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update(); // Notify listeners that the progress has ended
    return isSuccess;
  }
}
