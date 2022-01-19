import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';

String createLink(LatLng posX, LatLng posY) {
  double xLat = posX.latitude;
  double xLon = posX.longitude;
  double yLat = posY.latitude;
  double yLon = posY.longitude;
  double mLat = yLat + (xLat - yLat);
  double mLon = yLon + (xLon - yLon);
  return "https://www.openstreetmap.org/directions?engine=fossgis_osrm_foot&route=${xLat}%2C${xLon}%3B${yLat}%2C${yLon}#map=15/${mLat}/${mLon}";
}
