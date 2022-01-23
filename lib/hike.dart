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
  final Triangle points;
  final directions;
  Hike({Key? key, required this.points, required this.directions}) : super(key: key);
  State <StatefulWidget> createState () {
    return HikeState();
  }
}

class HikeState extends State<Hike> {
  var link = "";

  HikeState() {
    //link = createLink(widget.points.first(), widget.points.second());
    //link = createLink(widget.points.first(), widget.points.second());
  }

  void initState() {
    link = createLink(widget.points.first(), widget.points.second());
  }


  updateLink() {
    setState(() {
      link = createLink(widget.points.second(), widget.points.third());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
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
          link != "" ? Map(link: link) : CircularProgressIndicator(),
          Container(
            child: TextButton(
              onPressed: () { updateLink(); },
              child: Text("Reached midway point!"),
            )
          ),
          //Map(link: widget.link),
        ]
      )
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
            height: 400,
            child: WebView(
                initialUrl: widget.link,
                javascriptMode: JavascriptMode.unrestricted,
                backgroundColor: Colors.black
            ),
    );
  }
}
