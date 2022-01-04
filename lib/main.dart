import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'map.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  static const String ACCESS_TOKEN =
  String.fromEnvironment(
    "pk.eyJ1IjoibWEyMm9tIiwiYSI6ImNreG1pOXd6aTFlaHAycnFrMGQzamtlb3oifQ.Hi-KmeVm6xVR4kBWAHDhDA"
  );

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(325, 667),
        builder: () => MaterialApp(
          title: 'Luftetur',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*Container(
                    child: Center(
                        child: Text(
                            "Luftetur",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 32,
                              color: Colors.black)))),*/
                Home()
              ])
            )
    );
  }
}
