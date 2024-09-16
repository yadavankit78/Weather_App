
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:weather_app/data/app_exception.dart';
import 'package:weather_app/data/network/base_api_services.dart';

class NetworkApiServices extends BaseApiServices {
  @override
  Future<dynamic> getApi(String url) async {
    
    dynamic responseJson ;
    try{
            final response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 10));
            responseJson = returnResponse(response); 
            print(response.body);
    }
    on SocketException {
      throw InternetException();
    }
    on RequestTimeout {
      throw RequestTimeout();
    }
   
   return responseJson ;
   
  }


  dynamic returnResponse(http.Response response){
     switch(response.statusCode){
        case 200 : 
        dynamic responseJson = jsonDecode(response.body);
        print('jsonRes $responseJson');
        return responseJson ;

        case 400 : 
        dynamic responseJson = jsonDecode(response.body);
        return responseJson ;
       
        default : 
        throw FetchDataException('Error Occured while communicating with server'+ response.statusCode.toString());
     }
  }



}