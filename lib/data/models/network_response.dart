class NetworkResponse{
  final int statusCode;
  final bool isSuccess;
  dynamic responseData;
  String? errorMessage;


  NetworkResponse({
      required this.statusCode,
  required this.isSuccess,
    required this.responseData,
  this.errorMessage='Something went wrong',
 }
 );
}