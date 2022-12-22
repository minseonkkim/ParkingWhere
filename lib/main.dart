import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:parkwhere/ui/view/main_page.dart';
import 'package:parkwhere/service/background_service.dart';
import 'package:provider/provider.dart';
import 'package:kakao_flutter_sdk_common/kakao_flutter_sdk_common.dart';
import 'dart:io';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: '5c823315b9f4a9f05242f04e637b68e4',
    javaScriptAppKey: '3737b76c48bd201767e3d3eb13b88cc3',
  );
  HttpOverrides.global = MyHttpOverrides();
  runApp(GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 정방향
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '주정차 알리미',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}