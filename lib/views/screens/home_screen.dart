import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/view-model/help_vm.dart';

class HomeScreen extends StatefulWidget {
  static const  String routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}


class _HomeScreenState extends State<HomeScreen> {
final locationController = TextEditingController();



@override
  void initState(){
    final provider =  Provider.of<HelpVm>(context , listen: false);
    provider.getWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor:Colors.black12 ,
        title: const Text('Weather App' ,
        style: TextStyle(
          color: Colors.white
        ),),
        
      ),
      body: Consumer<HelpVm>(
        builder: (context, value, child) {
          return 
           SingleChildScrollView(
             child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
                       children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                child: TextFormField(
                  style:const TextStyle(
                    color: Colors.white ,
                  ),
                  controller: locationController,
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Location',
                    
                    hintStyle: TextStyle(color: Colors.white),
                    disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey ,width: 1)),
                    focusedBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.white , width: 1)), 
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
             const SizedBox(height: 10,),
               ElevatedButton(
                style:const ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.amber),
                    foregroundColor: WidgetStatePropertyAll(Colors.white),
                     textStyle: WidgetStatePropertyAll(TextStyle(fontWeight:FontWeight.bold ))
                  ),
                onPressed: (){
                value.getWeatherByLocation(locationController.text);
              },
               child: const Text("Save")),
                      const SizedBox(height: 30,),
                     const Center(child: Icon(Icons.cloud , size: 250, color: Colors.grey,)),
             
                       Center(child: value.weather != null ? Text('${value.weather!.current!.tempC.toString()}°C',
                       style:const TextStyle(
              color: Colors.white ,
              fontSize: 30 ,
              fontWeight: FontWeight.bold,
                       ),): const CircularProgressIndicator()),
                      const SizedBox(height: 5,),
                       Center(child:value.weather != null ? Text(value.weather!.current!.condition!.text.toString(),
                       style:const TextStyle(
              color: Colors.white ,
              fontSize: 16 ,
              fontWeight: FontWeight.w400,
                       ),): null),
                       const SizedBox(height: 5,),
                       Center(child:value.weather != null ? Text(value.weather!.location!.name.toString(),
                       style:const TextStyle(
              color: Colors.white ,
              fontSize: 25 ,
              fontWeight: FontWeight.w400,
                       ),): null),
             
                       ],
                     ),
           );
        },
      ),
    );
  }
}