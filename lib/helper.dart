import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
//import 'package:flutter_map/flutter_map.dart';

String createLink(LatLng posX, LatLng posY) {
  double xLat = posX.latitude;
  double xLon = posX.longitude;
  double yLat = posY.latitude;
  double yLon = posY.longitude;
  double mLat = yLat + (xLat - yLat);
  double mLon = yLon + (xLon - yLon);
  return "https://www.openstreetmap.org/directions?engine=fossgis_osrm_foot&route=${xLat}%2C${xLon}%3B${yLat}%2C${yLon}#map=15/${mLat}/${mLon}";
}

class Triangle {
  List<LatLng> list = [];

  Triangle(List<LatLng> list) {
    this.list = list;
  }

  bool add(LatLng point) {
    if (isFull()) {
      return false;
    } else {
      list.add(point);
      return true;
    }
  }

  bool isFull() => list.length == 3 ? true : false;

  LatLng first() {
    return list.first;
  }

  LatLng second() {
    return list[1];
  }

  LatLng third() {
    return list.last;
  }

  void flush() {
    list = [];
  }
}
