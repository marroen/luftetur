import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
//import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapRoute extends StatelessWidget {
  @override
  Widget build (BuildContext context) {
    return Map();
  }
}

// Should be a map with directions in text format.
class Map extends StatefulWidget {
  State <StatefulWidget> createState () {
    return MapState();
  }
}

class MapState extends State<Map> {
  final points = <LatLng>[
    LatLng(60.27674093393177, 11.168688836436456),
    LatLng(60.26701310142105, 11.167889619277316),
  ];
  final directions =
      "Start med løypa i starten av hovedbakken ved speiderstua.\n"
      "Fortsett langs åkeren og fortsett til motorveien.";
  @override
  Widget build(BuildContext context) {
    return Path(points: points, directions: directions);
  }
}
class Path extends StatefulWidget {
  final points;
  final directions;
  const Path({
    Key? key, required this.points, required this.directions})
      : super(key: key);
  State <StatefulWidget> createState () {
    return PathState();
  }
}

class PathState extends State<Path> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
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
          Container(
              width: 400,
              height: 600,
              child: FlutterMap(
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
              ),
            ),
        ]
      );
  }
}
