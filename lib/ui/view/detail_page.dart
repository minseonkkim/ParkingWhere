import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk_navi.dart';
import 'package:parkwhere/model/parking_lot.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:kakaomap_webview/kakaomap_webview.dart';
import 'package:parkwhere/ui/widget/remain_stat_widget.dart';

const String kakaoMapKey = 'e6ae5b347961bbe5188a6798c896a3fb';


class DetailPage extends StatefulWidget {
  final ParkingLot data;
  const DetailPage(this.data);

  @override
  _DetailPageState createState() => _DetailPageState();
}

Future _NaviConnect(data) async{
  bool result = await NaviApi.instance.isKakaoNaviInstalled();
  if (result) {
    print('카카오내비 앱으로 길안내 가능');
    await NaviApi.instance.navigate(
      destination: Location(name: data.name, x: data.lng.toString(), y: data.lat.toString()),
      option: NaviOption(coordType: CoordType.wgs84),
    );
  } else {
    print('카카오내비 미설치');
    // 카카오내비 설치 페이지로 이동
    launchBrowserTab(Uri.parse(NaviApi.webNaviInstall));
  }
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    var name = widget.data.name;
    var address = widget.data.address;
    var tel = 01071769856;

    return Scaffold(
      appBar: CupertinoNavigationBar(
        backgroundColor: Colors.blue[300],
        middle: Text('주차장 정보',
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
                fontSize: 21.0,
                color: Colors.white)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
            child:Container(
              child: Column(
                children: [
                  SizedBox(height: 17.0),
                  Text('${name}',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 8.0,),
                  Text('${address}',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 17.0,
                        color: Colors.black)),
                  SizedBox(height: 17.0),
                  KakaoMapView(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.35,
                    kakaoMapKey: kakaoMapKey,
                    lat: widget.data.lat,
                    lng: widget.data.lng,
                    showMapTypeControl: false,
                    showZoomControl: false
                  ),
                  SizedBox(height: 10.0),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(flex: 1, child: SizedBox()),
                        // 전화하기
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: new TextButton(
                                  onPressed: () => launchUrl(Uri.parse('tel://${tel}')),
                                  child: new Icon(Icons.call,
                                      color: Colors.blue[600], size: 53),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                    "전화하기",
                                    style: GoogleFonts.lato(
                                        fontSize: 18.0,
                                        color: Colors.black)
                                ),
                              ),
                            ],
                          ),
                        ),

                        // 길찾기
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: new TextButton(
                                  onPressed: () {
                                    _NaviConnect(widget.data);
                                  },
                                  child: new Icon(Icons.directions,
                                      color: Colors.blue[600], size: 53),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5.0),
                                child: Text(
                                    "길찾기",
                                    style: GoogleFonts.lato(
                                        fontSize: 18.0,
                                        color: Colors.black)
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(flex: 1, child: SizedBox()),],
                  ),),
                  SizedBox(height: 20.0),
                  RemainStat(widget.data),
                    ],),

              ),
            ),

        ),
      );
  }
}