import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:http/http.dart' as http;
class Weatherservice {
  Future<Weathermodel?> getweatherservice({required String cityName} ) async{
try{
      String baseurl='http://api.weatherapi.com/v1';
    String apikey='6969f137f2564fc9bce224233231003';
    Uri url=Uri.parse('$baseurl/forecast.json?key=$apikey&q=$cityName&days=7');
    http.Response response = await http.get(url);
  Map <String,dynamic> data=jsonDecode(response.body);
  Weathermodel weather=Weathermodel.fromJson(data);
   return weather;
}
catch(e){
  print(e);
}
  }
}