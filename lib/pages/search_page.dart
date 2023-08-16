import 'package:flutter/material.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';


class Search extends StatelessWidget {

String? cityName;
VoidCallback? updateUI;
Search({this.updateUI});
  @override
  Widget build(BuildContext context) {

return Scaffold(
appBar: AppBar(
  title: Text('Search a city'),
),
body: Center(
  child:   Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: TextField(
      onSubmitted: (data) async{
        cityName=data;
        Weatherservice service=Weatherservice();
       Weathermodel? weather= await service.getweatherservice(cityName: cityName!);
       Provider.of<Weatherprovider>(context,listen: false).weatherData=weather;
              Provider.of<Weatherprovider>(context,listen: false).cityName=cityName;

       //updateUI!();
       Navigator.pop(context);

      },
      // onChanged: (data){
      //   print(data);
      // },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical:25,horizontal: 20),
        suffixIcon: Icon(Icons.search),
        border: OutlineInputBorder(),
  
      hintText: 'enter a city',
      labelText: 'search'
    
      ),
    
    ),
  ),
),

)
;

  }}
