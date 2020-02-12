import 'package:geolocator/geolocator.dart';
//create a new location class
class Location {
// create two properties (latitude and longitude)
  double latitude;
  double longitude;

// create a method called getCurrentLocation and move the code snippet of getCurrentPosition in the loading_screen to the getCurrentLocation method.
// In order to ensure that the getCurrentLocation method completes it's cycle before loading_screen gets currentLocation, we use the 'Future<void>, instead of just "void"
  Future<void> getCurrentLocation() async {
    try{ 
    Position position = await Geolocator()
    .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
       latitude = position.latitude;
       longitude = position.longitude;
         }catch(e){
           print(e);
         }
  }
  }
