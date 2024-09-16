import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/routes.dart';
import 'package:weather_app/view-model/help_vm.dart';
import 'package:weather_app/views/screens/help_screen.dart';

void main() {
  runApp(MultiProvider
  (providers: [
    ChangeNotifierProvider(create: (context) => HelpVm()),
  ]
    ,child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:const HelpScreen(),
      onGenerateRoute: (settings) => generateRoute(settings),
    );
  }
}
