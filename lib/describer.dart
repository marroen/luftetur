import 'package:flutter/material.dart';
import 'helper.dart';

class Describer extends StatefulWidget {
  State <StatefulWidget> createState () {
    return DescriberState();
  }
}

class DescriberState extends State<Describer> {
  var description;
  var directions;
  var image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("Write a description for your hike: "),
          Padding(
            padding: EdgeInsets.all(60.0),
            child: TextField(
              onChanged: (text) {
                description = text;
              },
            ),
          ),
          Text("Write some useful directions (such as where to turn): "),
          Padding(
            padding: EdgeInsets.all(60.0),
            child: TextField(
              onChanged: (text) {
                directions = text;
              }
            ),
          ),
          //Text("Upload an image (optional): "),
          TextButton(
            child: Text("Confirm!"),
            onPressed: () {
              Navigator.pop(
                context,
                Description(description, directions)
              );
            }
          )
        ]
      )
    );
  }
}


class Description {
  String description;
  String directions;
  //Image image;

  Description(this.description, this.directions);
}
