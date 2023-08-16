import 'package:flutter/material.dart';

import 'package:weather_app/pages/search_page.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:provider/provider.dart';


class Homepage extends StatefulWidget{

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


void updateUI(){
  setState(() {
    
  });
}

Weathermodel? weatherData;
@override
Widget build(BuildContext context){
  weatherData=Provider.of<Weatherprovider>(context).weatherData;

  return Scaffold(
  appBar: AppBar(
    title: Text('Weather App'),
    actions:[
      IconButton(onPressed: (){
Navigator.push(context, MaterialPageRoute(builder: (context){
return Search(
  updateUI:updateUI,
);
}));
      },
     icon:Icon(Icons.search))
    ],
  
  ),
  
  body: weatherData ==null?
  Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )      ],
    ),
  )
  :
   Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [weatherData!.getThemeColor(),
      weatherData!.getThemeColor()[100]!,
      weatherData!.getThemeColor()[300]!,

      ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      )
    ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           const Spacer(flex: 3,),
            Text(Provider.of<Weatherprovider>(context).cityName!,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
            Text(' ${weatherData!.date}',style: TextStyle(fontSize: 18)),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(weatherData!.getImage()),
                Text('${weatherData!.temp.toInt()}',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                Column(
                  children: [
                  Text('max : ${weatherData!.maxtemp.toInt()}',style: TextStyle(fontSize: 16)),
                  Text('min : ${weatherData!.mintemp.toInt()}',style: TextStyle(fontSize: 16)),
                  ],
                )
              ],
            ),
            Spacer(),
            Text(weatherData!.weatherstateName,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
            Spacer(flex: 6,),
          ],
        ),
      
   ),
  )
  );
}
}