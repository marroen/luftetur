import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
//import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'dart:io';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'helper.dart';

// Should be a map with directions in text format.
class Hike extends StatefulWidget {
  final points;
  final directions;
  final link = "https://www.openstreetmap.org/directions?engine=fossgis_osrm_foot&route=60.2770%2C11.1691%3B60.2707%2C11.1565#map=15/60.2738/11.1633";
  Hike({Key? key, required this.points, required this.directions}) : super(key: key);
  State <StatefulWidget> createState () {
    return HikeState();
  }
}

class HikeState extends State<Hike> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox( // SizedBox?
              width: 400,
              height: 60,
              child: Center(
                  child: Text(
                  widget.directions,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      decoration: TextDecoration.none,
                      backgroundColor: Colors.black,
                      color: Colors.white))) ),
          Map(link: toLink(widget.points.first, widget.points.last)),
          //Map(link: widget.link),
        ]
    );
  }
}
class Map extends StatefulWidget {
  final String link;
  Map({Key? key, required this.link}) : super(key: key);
  State <StatefulWidget> createState () {
    return MapState();
  }
}

class MapState extends State<Map> {
  /* Virtual display
  void initState() {
    super.initState();
    // Enable virtual display
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }
  */

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: 400,
            height: 600,
            child: WebView(
                initialUrl: widget.link,
                javascriptMode: JavascriptMode.unrestricted,
                backgroundColor: Colors.black),
            /*child: FlutterMap(
              options: MapOptions(
                  center: LatLng(60.27674093393177, 11.168688836436456),
                  zoom: 13.0,
              ),
              layers: [
                TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                    subdomains: ['a', 'b', 'c'],
                    //attributionBuilder: (_) {
                      //return Text("© OpenStreetMap contributors");
                    //},
                ),
                PolylineLayerOptions(
                    polylines: [
                      Polyline(
                          points: widget.points,
                          strokeWidth: 4.0,
                          color: Colors.red)]),
                MarkerLayerOptions(
                    markers: [
                      Marker(
                          width: 20.0,
                          height: 20.0,
                          point: LatLng(60.27674093393177, 11.168688836436456),
                          builder: (ctx) =>
                          Container(
                              child: Icon(Icons.accessibility)
                          ),
                      ),
                      Marker(
                          width: 20.0,
                          height: 20.0,
                          point: LatLng(60.26701310142105, 11.167889619277316),
                          builder: (ctx) =>
                          Container(
                              child: Icon(Icons.flag) 
                          ),
                      ),
                    ],
                ),
              ],
            ),*/
    );
  }
}
