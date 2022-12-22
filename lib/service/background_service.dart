import 'package:latlong2/latlong.dart';
import 'dart:async';
import 'dart:ui';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:flutter_background_service_ios/flutter_background_service_ios.dart';
import 'package:parkwhere/repository/location_repository.dart';
import 'package:parkwhere/service/notification.dart';
import 'package:flutter_tts/flutter_tts.dart';

void backgroundInitialize() async{
  final service = FlutterBackgroundService();
  await service.configure(iosConfiguration: IosConfiguration(), androidConfiguration: AndroidConfiguration(onStart: backgroundService, isForegroundMode: false));
  service.startService();
}

@pragma('vm:entry-point')
void backgroundService(ServiceInstance service){
  DartPluginRegistrant.ensureInitialized();
  var _locationRepository = LocationRepository();
  final tts = FlutterTts();
  List<List<LatLng>> restricted = [
    [LatLng(35.176384, 126.912501), LatLng(35.176429, 126.912472), LatLng(35.176540, 126.914454), LatLng(35.176461, 126.914443)],
    [LatLng(35.175502, 126.912625), LatLng(35.175449, 126.912631), LatLng(35.175549, 126.914296), LatLng(35.175591, 126.914318)],
    [LatLng(35.174384, 126.912767), LatLng(35.174279, 126.912785), LatLng(35.174419, 126.913038), LatLng(35.174514, 126.913010)],
    [LatLng(35.176478, 126.914468), LatLng(35.176478, 126.914542), LatLng(35.1760929, 126.914575), LatLng(35.176089, 126.914505)],
    [LatLng(35.175986, 126.913120), LatLng(35.175938, 126.913123), LatLng(35.176027, 126.914500), LatLng(35.176080, 126.914492)],
    [LatLng(35.178589, 126.912012), LatLng(35.178589, 126.912193), LatLng(35.174395, 126.912771), LatLng(35.174299, 126.912652)]
  ];
  int count = 0;
  Distance distance = Distance();
  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }
  service.on('stopService').listen((event) {
    service.stopSelf();
  });
 
  Timer.periodic(Duration(seconds: 10), (timer) async {
    await _locationRepository.getCurrentPosition();
    await tts.setLanguage('ko-KR');
    await tts.setSpeechRate(0.7);
    for(int i = 0; i < restricted.length; i++){
      double d1 = distance.as(LengthUnit.Meter, LatLng(_locationRepository.lat, _locationRepository.lng), restricted[i][0]);
      double d2 = distance.as(LengthUnit.Meter, LatLng(_locationRepository.lat, _locationRepository.lng), restricted[i][1]);
      double d3 = distance.as(LengthUnit.Meter, LatLng(_locationRepository.lat, _locationRepository.lng), restricted[i][2]);
      double d4 = distance.as(LengthUnit.Meter, LatLng(_locationRepository.lat, _locationRepository.lng), restricted[i][3]);
      if(d1 < 50 || d2 < 50 || d3 < 50 || d4 < 50){
        count++;
        i -= 1;
        if(count == 3){
          showNotification();
          tts.speak("현재 주차하신 위치는 주정차 금지 구역입니다");
          count = 0;
          break;
        }
      }
      else{
        count = 0;
      }
    }
  });
}
