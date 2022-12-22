import 'package:flutter/material.dart';
import 'dart:convert';

class ParkingLot{
  String name;
  String address;
  double lat;
  double lng;
  int totalAbleCnt;
  int ableCnt;
  
  ParkingLot(this.name, this.address, this.lat, this.lng, this.totalAbleCnt, this.ableCnt);

  factory ParkingLot.fromJson(dynamic json){
    return ParkingLot(json['name'] as String, json['address'] as String, double.parse(json['latitude'] as String), double.parse(json['longitude'] as String), int.parse(json['totalAbleCnt'] as String), int.parse(json['ableCnt'] as String));
  }
}