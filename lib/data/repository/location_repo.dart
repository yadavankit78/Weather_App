
import 'package:weather_app/data/network/network_api_services.dart';
import 'package:weather_app/models/weather.dart';


class HelpRepo {
  final NetworkApiServices _apiServices = NetworkApiServices();
Future<Weather> gethelpResponse(String url) async{
   var reponse = await _apiServices.getApi(url);
   return Weather.fromJson(reponse);
}
}