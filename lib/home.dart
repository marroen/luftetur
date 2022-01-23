import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';
import 'package:latlong2/latlong.dart';

import 'hike.dart';
import 'advert.dart';
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
  final points = Triangle([
      LatLng(60.27674093393177, 11.168688836436456),
      LatLng(60.26701310142105, 11.167889619277316),
  ]);

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
