import 'package:flutter/foundation.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:parkwhere/repository/location_repository.dart';
import 'package:parkwhere/service/get_parking_lot.dart';
import 'package:parkwhere/service/map_functions.dart';
import 'package:parkwhere/model/parking_lot.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:parkwhere/ui/view/detail_page.dart';
import 'dart:async';

const String kakaoMapKey = 'e6ae5b347961bbe5188a6798c896a3fb';
class MapPage extends StatefulWidget {
  final LocationRepository data;
  final BitmapDescriptor icon;
  // const MapPage({Key? key}) : super(key: key);
  const MapPage(this.data, this.icon);
  
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Future<List<ParkingLot>> p = getParkingLot();
  Completer<GoogleMapController> _controller = Completer();
  List<Marker> _markers = [];
  List<Polygon> _polygons = [];
  int _selectedIndex = 0;
  List<List<LatLng>> restricted = [
    [LatLng(35.176384, 126.912501), LatLng(35.176429, 126.912472), LatLng(35.176540, 126.914454), LatLng(35.176461, 126.914443)],
    [LatLng(35.175502, 126.912625), LatLng(35.175449, 126.912631), LatLng(35.175549, 126.914296), LatLng(35.175591, 126.914318)],
    [LatLng(35.174384, 126.912767), LatLng(35.174279, 126.912785), LatLng(35.174419, 126.913038), LatLng(35.174514, 126.913010)],
    [LatLng(35.176478, 126.914468), LatLng(35.176478, 126.914542), LatLng(35.1760929, 126.914575), LatLng(35.176089, 126.914505)],
    [LatLng(35.175986, 126.913120), LatLng(35.175938, 126.913123), LatLng(35.176027, 126.914500), LatLng(35.176080, 126.914492)],
    [LatLng(35.179735, 126.912067), LatLng(35.179669, 126.912060), LatLng(35.179747, 126.912701), LatLng(35.179796, 126.912708)],
    [LatLng(35.179726, 126.912815), LatLng(35.179714, 126.912867), LatLng(35.178744, 126.912851), LatLng(35.178750, 126.912816)],
  ];
  List<List<LatLng>> permitted = [
    [LatLng(35.177333, 126.912353), LatLng(35.177528, 126.915639), LatLng(35.177469, 126.915631), LatLng(35.177278, 126.912364)],
    [LatLng(35.176792, 126.912411), LatLng(35.176882, 126.913269), LatLng(35.176843, 126.913279), LatLng(35.176743, 126.912426)],
    [LatLng(35.177008, 126.914426), LatLng(35.176951, 126.914432), LatLng(35.177082, 126.915681), LatLng(35.177026, 126.915679)],
    [LatLng(35.177584, 126.912897), LatLng(35.177881, 126.913098), LatLng(35.177860, 126.913142), LatLng(35.177539, 126.912931)],
    [LatLng(35.177584, 126.912897), LatLng(35.177658, 126.912750), LatLng(35.177616, 126.912727), LatLng(35.177538, 126.912877)]
  ];
  List<LatLng> crackdown = [LatLng(35.179822, 126.911960), LatLng(35.179813, 126.912034), LatLng(35.174367, 126.912753), LatLng(35.174294, 126.912675)];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context){
    double lat = widget.data.lat;
    double lng = widget.data.lng;
  
    return Scaffold(
      body: FutureBuilder(
          future: p,
          builder: ((context, snapshot) {
            if(snapshot.hasData){
              for(int i = 0; i < snapshot.data!.length; i++){
                _markers.add(Marker(
                markerId: MarkerId(i.toString()),
                position: LatLng(snapshot.data![i].lat, snapshot.data![i].lng),
                infoWindow: InfoWindow(title: "여유 공간:" + snapshot.data![i].ableCnt.toString()),
                onTap: () {
                  Get.to(DetailPage(snapshot.data![i]));
                },
                icon: widget.icon
                ));
              }
              for(int i = 0; i < restricted.length; i++){
                _polygons.add(Polygon(
                  polygonId: PolygonId(i.toString()),
                  points: restricted[i],
                  strokeColor: Colors.red,
                  strokeWidth: 2,
                  fillColor: Colors.red.withOpacity(0.15)
                  ));
              }
              for(int i = 0; i < permitted.length; i++){
                _polygons.add(Polygon(
                  polygonId: PolygonId(i.toString()),
                  points: permitted[i],
                  strokeColor: Color.fromARGB(255, 45, 136, 197),
                  strokeWidth: 2,
                  fillColor: Color.fromARGB(255, 45, 136, 197).withOpacity(0.15)
                  ));
              }
              _polygons.add(Polygon(
                polygonId: PolygonId("crackdown"),
                points: crackdown,
                strokeColor: Color.fromARGB(255, 79, 30, 158),
                strokeWidth: 2,
                fillColor: Color.fromARGB(255, 79, 30, 158).withOpacity(0.15)
              ));
              return  MaterialApp(
                home: DefaultTabController(
                length: 2,
                child: Scaffold(appBar: CupertinoNavigationBar(
                    backgroundColor: Colors.blue[300],
                    middle: Text('주정차 알리미',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.lato(
                        fontSize: 21.0,
                        color: Colors.white)),
                      ),
                    body: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SafeArea(
                          child: GoogleMap(
                            mapType: MapType.normal,
                            initialCameraPosition: CameraPosition(target: LatLng(lat, lng), zoom: 17),
                            markers: Set.from(_markers),
                            polygons: Set.from(_polygons),
                            onMapCreated: ((controller) {
                              if(_controller.isCompleted == false) _controller.complete(controller);
                        }),
                      )),
                      Center(
                        child: Expanded(child: Image.asset('assets/images/info.png'))
                      )
                    ]),
                    extendBodyBehindAppBar: true,
              bottomNavigationBar: Container(
              color: Colors.transparent, //색상
              child: Container(
                height: 70,
                padding: EdgeInsets.only(bottom: 10, top: 5),
                child: const TabBar(
                //tab 하단 indicator size -> .label = label의 길이
                //tab 하단 indicator size -> .tab = tab의 길이
                indicatorSize: TabBarIndicatorSize.label,
                //tab 하단 indicator color
                indicatorColor: Colors.red,
                //tab 하단 indicator weight
                indicatorWeight: 2,
                //label color
                labelColor: Colors.red,
                //unselected label color
                unselectedLabelColor: Colors.black38,
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.map_outlined),
                    text: '지도',
                  ),
                  Tab(
                    icon: Icon(Icons.book),
                    text: '사용안내',
                  )
                ],
              ),
            )
          )
        )
      ));
            }else {
             List<Widget> children = const <Widget>[
                SizedBox(
                  child: CircularProgressIndicator(),
                  width: 60,
                  height: 60,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Text('지도를 불러오는 중...'),
                )
              ];
	          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: children
              )
            );
            }
          })
        )
      );
  }
}
