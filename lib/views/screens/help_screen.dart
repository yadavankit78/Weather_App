import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view-model/help_vm.dart';
import 'package:weather_app/views/screens/home_screen.dart';

class HelpScreen extends StatefulWidget {
 static const  String routeName = '/helpScreen';
  const HelpScreen({super.key});

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {


 @override
  void initState() {
    final provider =  Provider.of<HelpVm>(context , listen: false);
    Future.delayed(const Duration(seconds: 5),() => Navigator.pushReplacementNamed(context , HomeScreen.routeName));
    provider.getCurrentLocation();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
       children: [
          Center(
            child: Image.asset('assets/images/bg.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            ),
          ),
           Positioned(
            bottom: 70,
            left: 20,
            right: 20,
             child: Center(
               child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text("We show weather for you" ,style: TextStyle(
                          color: Colors.white ,
                          fontSize: 30 ,
                          fontWeight: FontWeight.bold,
                        ),),
                        const SizedBox(height: 10,),
                        ElevatedButton(
                          style:const ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(Colors.amber),
                            foregroundColor: WidgetStatePropertyAll(Colors.white),
                            textStyle: WidgetStatePropertyAll(TextStyle(fontWeight:FontWeight.bold ))
                          ),
                          onPressed: (){
                        Navigator.pushReplacementNamed(context, HomeScreen.routeName);
                          },
                          child:const Text('Skip'),
                        ),
                      ],
                    ),
             ),
           ),
       ],
        ),
      );
  }
}
