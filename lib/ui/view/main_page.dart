import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:parkwhere/service/background_service.dart';
import 'package:parkwhere/ui/view/map_page.dart';
import 'package:flutter/material.dart';
import 'package:parkwhere/service/notification.dart';
import 'package:parkwhere/service/permission.dart';
import 'package:parkwhere/repository/location_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var isSwitched = false;
  LocationRepository repo = LocationRepository();
  final tts = FlutterTts();

  @override
  void initState(){
    super.initState();
    initNotification();
    getPermission();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 229, 229, 233),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: newheight * 0.2,
              padding: EdgeInsets.only(top: 20.0, left: 5.0, bottom: 20.0),
              child: Row(
                children: [
                  SizedBox(width: 15.0),
                  Image.asset('assets/images/icon.png', width: MediaQuery.of(context).size.height * 0.14),
                  SizedBox(width: 18.0),
                  Text('주정차 알리미', style: GoogleFonts.lato(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
                ],
              ),
            ),
            Container(
              height: newheight * 0.76,
              margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: newheight * 0.04),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: CupertinoColors.systemGrey6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  SizedBox(
                    height: newheight * 0.25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.61,
                    height: newheight * 0.13,
                    child: OutlinedButton(
                      onPressed: () async{
                        BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/images/marker.png');
                        await repo.getCurrentPosition();
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return (MapPage(repo, icon));
                            }));
                      },
                      child: Text(
                        '지도 보기',
                      ),
                      style: OutlinedButton.styleFrom(
                          backgroundColor: CupertinoColors.systemTeal,
                          primary: CupertinoColors.systemGrey6,
                          shadowColor: Colors.white,
                          //side: BorderSide(color: Colors.white, width: 3.0),
                          textStyle: GoogleFonts.lato(
                              fontSize: 27.0,
                              fontWeight: FontWeight.w600
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          elevation: 7.0),),
                  ),
                  SizedBox(
                    height: newheight * 0.215,
                  ),
                  Container(
                    height: newheight * 0.165,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Icon(
                              isSwitched ? Icons.alarm_on : Icons.alarm_off,
                              color: isSwitched
                                  ? CupertinoColors.systemBlue
                                  : CupertinoColors.systemRed,
                              size: 35,
                            ),
                            Text(
                                isSwitched? '  주정차 금지구역 알림 켜짐' : '  주정차 금지구역 알림 꺼짐',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[700])),
                          ],
                        ),
                        SizedBox(height: 4.0,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                                isSwitched? '알림 끄기  ' : '알림 켜기  ',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: 21.0,
                                    color: isSwitched? CupertinoColors.systemRed : CupertinoColors.systemBlue)),
                            CupertinoSwitch(
                                value: isSwitched,
                                activeColor: CupertinoColors.systemRed,
                                trackColor: CupertinoColors.systemBlue.withOpacity(0.2),
                                onChanged: ((bool value) async{
                                  WidgetsFlutterBinding.ensureInitialized();
                                  var status = await FlutterBackgroundService().isRunning();
                                  setState(() {
                                    isSwitched = value;
                                    if(isSwitched){
                                      backgroundInitialize();
                                    }
                                    else{
                                      if(status) FlutterBackgroundService().invoke("stopService");
                                    }
                                  });
                                })),
                          ],
                        ),
                      ],
              ))
            ],
          )
        ),
      ])
    ));
  }
}