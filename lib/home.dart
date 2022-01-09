import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';
import 'hike.dart';
import 'creator.dart';
import 'helper.dart';

// Should be one or multiple lines of adverts.
class Home extends StatefulWidget {
  State <StatefulWidget> createState () {
    return HomeState();
  }
}

class HomeState extends State<Home> {

  // For Home view
  static const String description =
      "Skaubanen er en strøken luftetur i nærheten av Råholt sentrum.\n"
      "Det finnes stier med forskjellige lengder og høyder.";
  static const String image = "images/skaubanen.jpg";
 
  // For Advert view
  final points = <LatLng>[
    LatLng(60.27674093393177, 11.168688836436456),
    LatLng(60.26701310142105, 11.167889619277316),
  ];
  static const directions =
      "Start med løypa i starten av hovedbakken ved speiderstua.\n"
      "Fortsett langs åkeren og fortsett til motorveien.";
  List<Advert> list = [];

  HomeState() {
    list = [Advert(description: description, image: image,
            points: points, directions: directions)];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(children: list),
          TextButton(
              child: const Text("Add a new hiking path"),
              onPressed: () {
                // go to hike creator
                /*Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Creator())
                );
                */
                getNewAdvert();
              },
          ),
        ]
    );
  }

  Future<void> getNewAdvert() async {
    final advert = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Creator()
        )
    );
    setState(() {
      list.add(advert);
    });
  }
}

class Advert extends StatefulWidget {
  final String description;
  final String image;
  final List<LatLng> points;
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
                  data: toLink(widget.points.first, widget.points.last),
                  version: QrVersions.auto,
                  backgroundColor: Colors.white)) ),
        ]
      ),
    );
  }
}
