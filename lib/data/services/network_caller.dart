import 'dart:convert';
import 'package:ostad_ecommerce/data/models/network_response.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart';
class NetworkCaller{
  final Logger logger;
  NetworkCaller({required this.logger});
  Future<NetworkResponse> getResult({required String url }) async {
   try{
     logger.i(url);
     requestLog(url, {}, {}, '');
     Uri uri = Uri.parse(url);
      final  response = await get(uri,headers: {
        'token':'',
      });
      if (response.statusCode == 200) {
        _responseLog(url, response.statusCode, response.body, response.headers, true);
        final decodeBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeBody,
        );
      }else {
        _responseLog(url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false, responseData: null,
        );
      }
    }catch (e){
     _responseLog(url, -1, null, {},false, e);
     return NetworkResponse(
       statusCode: -1,
       isSuccess: false,
       responseData: e.toString(),
     );
   }
  }
  Future<NetworkResponse> postResult({required String url , Map<String ,dynamic>?body }) async {
    try{
      Uri uri = Uri.parse(url);
      requestLog(url, {}, body?? {},'');
      final  response = await post(uri,headers: {
        'token':'',
        'content-type':'',
      },body:jsonEncode(body),
      );
      if (response.statusCode == 200) {
        _responseLog(url, response.statusCode, response.body, response.headers, true);
        final decodeBody = jsonDecode(response.body);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeBody,
        );
      } else {
        _responseLog(url, response.statusCode, response.body, response.headers, false);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          responseData: null,
        );
      }
    }catch (e){
      _responseLog(url, -1, null, {},false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        responseData: e.toString(),
      );
    }
  }
  void requestLog (String url,Map<String,dynamic>prmas,Map<String,dynamic>body,String token){
    logger.i('''
    
    Uri:$url
    Params:$prmas
    body:$body,
    Token:$token
    ''');
  }
  void _responseLog (String url,int statusCode,dynamic reponseBody,
      Map<String ,dynamic >headers,bool isSuccess,[dynamic error]){
    String message ='''
    Uri:$url
    status Code:$statusCode
    headers:$headers,
    Response Body :$reponseBody
    Error :$reponseBody
    ''';

    if(isSuccess){
      logger.i(message);
    }else{
      logger.e(message);
    }
  }
}