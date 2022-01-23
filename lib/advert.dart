import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'hike.dart';
import 'helper.dart';

class Advert extends StatefulWidget {
  final String description;
  final String image;
  final Triangle points;
  final String directions;
  Advert({
    Key? key, required this.description, required this.image,
    required this.points, required this.directions})
    : super(key: key);

  State <StatefulWidget> createState () {
    return AdvertState();
  }
}

class AdvertState extends State<Advert> {
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Hike(
                      points: widget.points, directions: widget.directions))
          );
        },
        child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
              child: Container(
                height: 200,
                child: Image(image: AssetImage(widget.image))) ),
          Flexible(
              child: Container(
                height: 200,
                child: Center(
                  child: Text(
                    widget.description,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        decoration: TextDecoration.none,
                        backgroundColor: Colors.black,
                        color: Colors.white)))) ),
          Flexible(
              child: Container(
                height: 200,
                child: QrImage(
                  //data: "https://www.openstreetmap.org/directions?engine=fossgis_osrm_foot&route=60.2770%2C11.1691%3B60.2707%2C11.1565#map=15/60.2738/11.1633",
                  data: createLink(widget.points.first(), widget.points.third()),
                  version: QrVersions.auto,
                  backgroundColor: Colors.white)) ),
        ]
      ),
    );
  }
}
