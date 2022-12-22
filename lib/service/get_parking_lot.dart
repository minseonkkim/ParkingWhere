import 'package:encrypt/encrypt_io.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:parkwhere/model/parking_lot.dart';

Future<List<ParkingLot>> getParkingLot() async{
  String key = "e6e03%2FEY6m0cOGi6BUs%2BFnF4wpBWjpt64e03%2BDRuqEF9wNQpzaVECQY76dpLlUfminxyM1Okra0KXsDj4uw03A%3D%3D";
  String url = "https://apis.data.go.kr/6290000/gjcitsdata/getFreeParkingSpace?serviceKey=";
  List<ParkingLot> parkingLot = [];
  var res = await http.get(Uri.parse(url + key));
  var rawData = utf8.decode(res.bodyBytes);
  var data = jsonDecode(rawData)['data'] as List;
  final List<ParkingLot> pList = data.map((e) => ParkingLot.fromJson(e)).toList();
  parkingLot.clear();
  parkingLot.addAll(pList);

  return parkingLot;
}
