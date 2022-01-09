import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(325, 667),
        builder: () => MaterialApp(
          title: 'Luftetur',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Home()/*Column(
              children: [
                Home()
              ])*/
        )
    );
  }
}
