import 'package:flutter/material.dart';
import 'package:weather_app/views/screens/help_screen.dart';
import 'package:weather_app/views/screens/home_screen.dart';

Route<dynamic> generateRoute(RouteSettings routeSetting){
  switch(routeSetting.name){
    case HelpScreen.routeName :
    return MaterialPageRoute(builder: (context) => const HelpScreen(),
    settings: routeSetting 
    );

   case HomeScreen.routeName :
    return MaterialPageRoute(builder: (context) => const HomeScreen(),
    settings: routeSetting 
    );
    
      default:
      return MaterialPageRoute(
          builder: (context) => const Scaffold(
                body: Center(child: Text("Screen does not exist!")),
              ),
          settings: routeSetting);
  
  }
 
}