class Urls{
  static const String _baseUrl ='https://ecommerce-api.codesilicon.com/api';
  static const String dummyUrl='/';
  static const String sliderListUrl='$_baseUrl/ListProductSlider';
  static const String categoryListUrl='$_baseUrl/CategoryList';
  static  String productListByRemark(String remark)=>'$_baseUrl/ListProductByRemark/remark';
}