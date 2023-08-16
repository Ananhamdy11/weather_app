import 'package:flutter/material.dart';

class Weathermodel{
   String date;
   double temp;
   double maxtemp;
   double mintemp;
   String weatherstateName;

  Weathermodel({required this.date,required this.temp,required this.maxtemp,required this.mintemp,required this.weatherstateName});


// factory constructor مهم جدااااااااا

factory Weathermodel.fromJson(dynamic data){
  var jsondata=data['forecast']['forecastday'][0]['day'];
  // data=data['location']['localtime'] ;
  // temp=jsondata['avgtemp_c'];
  //   maxtemp= jsondata['maxtemp_c'];
  //   mintemp= jsondata['mintemp_c'];
  //   weatherstateName= jsondata['condition']['text'];
  print(jsondata);

  return Weathermodel(
    date: data['location']['localtime'], 
  temp: jsondata['avgtemp_c'],
   maxtemp: jsondata['maxtemp_c'], 
   mintemp: jsondata['mintemp_c'], 
   weatherstateName:jsondata['condition']['text'],
   );

}
  @override
  String toString() {
    return 'temp = $temp  minTemp = $mintemp  date = $date';
  }

String getImage(){
if (weatherstateName == 'Sunny' || weatherstateName == 'Clear' ||  weatherstateName == 'partly cloudy') {
      return 'assets/images/clear.png';
    } else if (
        
        weatherstateName == 'Blizzard' ||  weatherstateName == 'Patchy snow possible'  ||  weatherstateName == 'Patchy sleet possible' || weatherstateName == 'Patchy freezing drizzle possible' || weatherstateName == 'Blowing snow') {
      return 'assets/images/snow.png';
    } else if (weatherstateName == 'Freezing fog' || weatherstateName == 'Fog' ||  weatherstateName == 'Heavy Cloud' || weatherstateName == 'Mist' || weatherstateName == 'Fog'||weatherstateName
    =='Overcast'|| weatherstateName=='Partly cloudy') {
      return 'assets/images/cloudy.png';
    } else if (weatherstateName == 'Patchy rain possible' ||
        weatherstateName == 'Heavy Rain' ||
        weatherstateName == 'Showers	') {
      return 'assets/images/rainy.png';
    } else if (weatherstateName == 'Thundery outbreaks possible' || weatherstateName == 'Moderate or heavy snow with thunder' || weatherstateName == 'Patchy light snow with thunder'|| weatherstateName == 'Moderate or heavy rain with thunder' || weatherstateName == 'Patchy light rain with thunder' ) {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
}
 MaterialColor getThemeColor() {
    if (weatherstateName == 'Sunny' || weatherstateName == 'Clear' ||  weatherstateName == 'partly cloudy') {
      return Colors.orange;
    } else if (
        
        weatherstateName == 'Blizzard' ||  weatherstateName == 'Patchy snow possible'  ||  weatherstateName == 'Patchy sleet possible' || weatherstateName == 'Patchy freezing drizzle possible' || weatherstateName == 'Blowing snow') {
      return Colors.blue;
    } else if (weatherstateName == 'Freezing fog' || weatherstateName == 'Fog' ||  weatherstateName == 'Heavy Cloud' || weatherstateName == 'Mist' || weatherstateName == 'Fog'||  weatherstateName == 'Partly cloudy'
    ||  weatherstateName == 'Cloudy') {
      return Colors.blueGrey;
    } else if (weatherstateName == 'Patchy rain possible' ||
        weatherstateName == 'Heavy Rain' ||  weatherstateName =='Overcast'||
        weatherstateName == 'Showers	') {
      return Colors.blue;
    } else if (weatherstateName == 'Thundery outbreaks possible' || weatherstateName == 'Moderate or heavy snow with thunder' || weatherstateName == 'Patchy light snow with thunder'|| weatherstateName == 'Moderate or heavy rain with thunder' || weatherstateName == 'Patchy light rain with thunder' ) {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }


}
