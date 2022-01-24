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
  var linkA;
  var linkB;
  var linkC;

  void initState() {
    linkA = createLink(widget.points.first(), widget.points.second());
    linkB = createLink(widget.points.second(), widget.points.third());
    linkC = createLink(widget.points.third(), widget.points.first());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
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
          Map(linkA: linkA, linkB: linkB, linkC: linkC)
        ]
      )
    );
  }
}
class Map extends StatefulWidget {
  final String linkA;
  final String linkB;
  final String linkC;
  Map({Key? key, required this.linkA, required this.linkB, required this.linkC}) : 
      super(key: key);
  State <StatefulWidget> createState () {
    return MapState();
  }
}

class MapState extends State<Map> {
  late WebViewController controller;
  var view;
  var text;
  var turn;

  void initState() {

    view = WebView(
      initialUrl: widget.linkA,
      onWebViewCreated: (ctrl) {
        controller = ctrl;
      },

      javascriptMode: JavascriptMode.unrestricted,
      backgroundColor: Colors.black
    );

    text = "Reached midway point!";
    turn = 0;
  }

  updateView() {
    setState(() {
      turn++;
      switch(turn) {
        case 1: { controller.loadUrl(widget.linkB); text = "Return to startpoint!"; }
        break;
        case 2: { controller.loadUrl(widget.linkC); text = "Good hike!"; }
        break;
        case 3: { Navigator.pop(context); }
        break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
            children: [
              SizedBox(
                width: 400,
                height: 400,
                child: view
              ),
              Container(
                child: TextButton(
                  onPressed: () { updateView(); },
                  child: Text(text),
                ),
              )
            ]
          );
  }
}
