import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';

// Should be one or multiple lines of adverts.
class Home extends StatefulWidget {
  State <StatefulWidget> createState () {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  final String directions =
      "Skaubanen er en strøken luftetur i nærheten av Råholt sentrum.\n"
      "Det finnes stier med forskjellige lengder og høyder.";
  final String image = "images/skaubanen.jpg";
  @override
  Widget build(BuildContext context) {
    return Advert(directions: directions, image: image);
  }
}

class Advert extends StatefulWidget {
  final String directions;
  final String image;
  const Advert({
    Key? key, required this.directions, required this.image})
      : super(key: key);
  State <StatefulWidget> createState () {
    return AdvertState();
  }
}

class AdvertState extends State<Advert> {
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              height: 200,
              width: 200,
              child: Image(image: AssetImage(widget.image)) ),
          Container(
              height: 200,
              width: 200,
              child: Center(
                child: Text(
                  widget.directions,
                  softWrap: true,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black))) ),
          Container(
              height: 200,
              width: 200,
              child: QrImage(
              data: "https://www.openstreetmap.org/directions?engine=fossgis_osrm_foot&route=60.2770%2C11.1691%3B60.2707%2C11.1565#map=15/60.2738/11.1633",
              version: QrVersions.auto,
              size: 200.0) ),
        ]
    );
  }
}
