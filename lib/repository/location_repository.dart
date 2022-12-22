import 'package:geolocator/geolocator.dart';

class LocationRepository{
  double lat = 0;
  double lng = 0;

  Future<void> getCurrentPosition() async{
    LocationPermission permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    lat = position.latitude;
    lng = position.longitude;

  }
}