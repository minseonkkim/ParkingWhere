import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';
import 'package:parkwhere/ui/view/detail_page.dart';
import 'package:flutter/material.dart';

multiMarker(p){
  List<Marker> data = [];
  for(int i = 0; i < p.length; i++){
    data.add(Marker(
      markerId: MarkerId(i.toString()),
      position: LatLng(p[i].lat, p[i].lng),
      infoWindow: InfoWindow(title: "여유 공간:" + p[i].ableCnt.toString()),
      onTap: () {
        Get.to(DetailPage(p[i]));
      }
      ));
  }
  return data;
  // String positions = "var positions = [";
  // String names = "var names = [";
  // String totalCnts = "var totals = [";
  // String ableCnts = "var ables = [";
  // for(int i = 0; i < data.length; i++){
  //   positions += ("new kakao.maps.LatLng(" + data[i].lat.toString() + ", " + data[i].lng.toString() + ")");
  //   names += "'" + data[i].name + "'";
  //   totalCnts += data[i].totalAbleCnt.toString();
  //   ableCnts += data[i].ableCnt.toString();
  //   if(i == data.length - 1){
  //     positions += "];";
  //     names += "];";
  //     totalCnts += "];";
  //     ableCnts += "];";
  //     break;
  //   }
  //   else{
  //     positions += ", ";
  //     names += ", ";
  //     totalCnts += ", ";
  //     ableCnts += ", ";
  //   }
  // }
  // String code = positions + names + totalCnts + ableCnts + '''
  // var zoomControl = new kakao.maps.ZoomControl();
  // map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
  // var mapTypeControl = new kakao.maps.MapTypeControl();
  // map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

  // var polygon = new kakao.maps.Polygon({
  //       map: map,
  //       path: [
  //         new kakao.maps.LatLng(35.178809, 126.914272),
  //         new kakao.maps.LatLng(35.178750, 126.914263),
  //         new kakao.maps.LatLng(35.178617, 126.912170),
  //         new kakao.maps.LatLng(35.178683, 126.912179) 
  //     ],
  // strokeWeight: 2,
  //     strokeColor: '#FF00FF',
  //     strokeOpacity: 0.8,
  //     strokeStyle: 'dashed',
  //     fillColor: '#00EEEE',
  //     fillOpacity: 0.5
  // });

  // var restricted1 = [new kakao.maps.LatLng(35.17648, 126.91260), new kakao.maps.LatLng(35.17651, 126.91443)]
  // var restricted2 = [new kakao.maps.LatLng(35.17548, 126.91266), new kakao.maps.LatLng(35.17558, 126.91431)]
  // var restricted3 = [new kakao.maps.LatLng(35.17568, 126.91675), new kakao.maps.LatLng(35.17560, 126.91672)]
  // var restricted4 = [new kakao.maps.LatLng(35.17527, 126.91650), new kakao.maps.LatLng(35.17510, 126.91618)]
  // var restricted5 = [new kakao.maps.LatLng(35.17500, 126.91572), new kakao.maps.LatLng(35.17506, 126.91484)]
  // var restricted6 = [new kakao.maps.LatLng(35.17507, 126.91451), new kakao.maps.LatLng(35.17449, 126.91309)]

  // polygon.setMap(map);
  // for (var i = 0; i < positions.length; i++){
  //   var content = '<div style="font-size:small">' + names[i] + '<br>현재 주차 가능 공간:' + ables[i] + '</div>';
  //   var p = new kakao.maps.Marker({
  //     position: positions[i]
  //   });
  //   var info = new kakao.maps.InfoWindow({
  //     position: positions[i],
  //     content: content
  //   });
  //   p.setMap(map);
  //   info.open(map, p);
  // }
  // var r1 = new kakao.maps.Polyline({
  //   path: restricted1, 
  //   strokeWeight: 8,
  //   strokeColor: '#FFAE00',
  //   strokeOpacity: 0.7,
  //   strokeStyle: 'solid'
  // })
  // var r2 = new kakao.maps.Polyline({
  //   path: restricted2, 
  //   strokeWeight: 8,
  //   strokeColor: '#FFAE00',
  //   strokeOpacity: 0.7,
  //   strokeStyle: 'solid'
  // })

  // var r3 = new kakao.maps.Polyline({
  //   path: restricted3, 
  //   strokeWeight: 8,
  //   strokeColor: '#FFAE00',
  //   strokeOpacity: 0.7,
  //   strokeStyle: 'solid'
  // })

  // var r4 = new kakao.maps.Polyline({
  //   path: restricted4, 
  //   strokeWeight: 8,
  //   strokeColor: '#FFAE00',
  //   strokeOpacity: 0.7,
  //   strokeStyle: 'solid'
  // })

  // var r5 = new kakao.maps.Polyline({
  //   path: restricted5, 
  //   strokeWeight: 8,
  //   strokeColor: '#FFAE00',
  //   strokeOpacity: 0.7,
  //   strokeStyle: 'solid'
  // })

  // var r6 = new kakao.maps.Polyline({
  //   path: restricted6, 
  //   strokeWeight: 8,
  //   strokeColor: '#FFAE00',
  //   strokeOpacity: 0.7,
  //   strokeStyle: 'solid'
  // })
  // r1.setMap(map);
  // r2.setMap(map);
  // r3.setMap(map);
  // r4.setMap(map);
  // r5.setMap(map);
  // r6.setMap(map);

  // ''';
  // return code;
}
// Set<Polygon> polygons(){
  
// }