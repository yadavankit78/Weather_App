import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/data/repository/location_repo.dart';
import 'package:weather_app/models/weather.dart';

class HelpVm extends ChangeNotifier {

 Weather? _weather ;

 final HelpRepo _helpRepo = HelpRepo();

 Weather? get weather => _weather ;

 
 void getCurrentLocation()async{
 Position position = await determinePosition();
  SharedPreferences prefs = await SharedPreferences.getInstance();
 await prefs.setString('lat',position.latitude.toString());
 await prefs.setString('long',position.longitude.toString());
  // print(position.latitude.toString());
  // print(position.longitude.toString());
  notifyListeners();
 }

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the 
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale 
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  } 
  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition(locationSettings:const LocationSettings(accuracy: LocationAccuracy.high));
}


 void getWeather()async{
   SharedPreferences preferences = await SharedPreferences.getInstance();
   String? lat =  preferences.getString('lat');
   String? long =   preferences.getString('long');
   print('lat : $lat');
   print(long);
  final url = 'http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=$lat,$long';
   _weather = await _helpRepo.gethelpResponse(url);
   notifyListeners();
 }

 void getWeatherByLocation(String location)async{
  final url = 'http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=$location';
   _weather = await _helpRepo.gethelpResponse(url);
   notifyListeners();
 }

}