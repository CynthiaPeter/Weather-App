
import 'package:flutter/material.dart';
import 'package:my_weather_app/services/location.dart';
import 'package:http/http.dart'  as http;
import 'dart:convert';


const apiKey ='100ef8029913a78ceeb3129acb20b497';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

@override
  void initState() {
    super.initState();
    getLocation();
  }
//Updated getLocation(), so that:
  void getLocation() async {
    //1: creates a new location object
    Location location = Location();
    //2: Call the getCurrentLocation()
    await location.getCurrentLocation();
    //3: print the values stored in longitude & latitude
    latitude = location.latitude;
    longitude = location.longitude;

    getData();
  }

  void getData() async {
    http.Response response = await http.get(
      'http://api.openweathermap.org/data/2.5/forecast?lat=$latitude&lon=$longitude&appid=$apiKey');


          //http://api.openweathermap.org/data/2.5/forecast?lat=37.4219756&lon=-122.0839974&appid=100ef8029913a78ceeb3129acb20b497


    if (response.statusCode == 200) {
      String data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main'] ['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(temperature);
      print(condition);
      print(cityName);

    } else{
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Center(
      
      ),
    );
  }
}