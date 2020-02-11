import 'package:flutter/material.dart';
import 'package:my_weather_app/screens/loading_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Weather App',
      home: LoadingScreen(),
      theme: ThemeData.dark(),
    );
  }
}
