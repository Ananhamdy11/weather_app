import 'package:flutter/material.dart';

import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/pages/home_page.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create:(context){
        return Weatherprovider();
      },
      child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  // const MyApp({super.key});

Weathermodel? weather;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primarySwatch: Provider.of<Weatherprovider>(context).weatherData==null? Colors.blue :
          Provider.of<Weatherprovider>(context).weatherData!.getThemeColor(),

        ),
        debugShowCheckedModeBanner: false,
        home: Homepage(),
        
    );
  }
}

