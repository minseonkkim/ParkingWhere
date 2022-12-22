import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
final notifications = FlutterLocalNotificationsPlugin();

//1. 앱로드시 실행할 기본설정
initNotification() async {

  //안드로이드용 아이콘파일 이름
  var androidSetting = AndroidInitializationSettings('ic_launcher');
  var initializationSettings = InitializationSettings(
      android: androidSetting
  );
  await notifications.initialize(
    initializationSettings,
    //알림 누를때 함수실행하고 싶으면
    //onSelectNotification: 함수명추가
  );
}

//2. 이 함수 원하는 곳에서 실행하면 알림 뜸
showNotification() async {

  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 채널 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );


  // 알림 id, 제목, 내용 맘대로 채우기
  notifications.show(
      1,
      '주정차 금지 구역 알리미',
      '현재 주차하신 위치는 주정차 금지 구역입니다.',
      NotificationDetails(android: androidDetails)
  );
}
showNotification2() async {

  var androidDetails = AndroidNotificationDetails(
    '유니크한 알림 채널 ID',
    '알림종류 설명',
    priority: Priority.high,
    importance: Importance.max,
    color: Color.fromARGB(255, 255, 0, 0),
  );


  // 알림 id, 제목, 내용 맘대로 채우기
  notifications.show(
      1,
      '주정차 금지 구역 알리미',
      '현재 위치는 주정차 집중 단속 구역입니다. 주의하십시오.',
      NotificationDetails(android: androidDetails)
  );
}