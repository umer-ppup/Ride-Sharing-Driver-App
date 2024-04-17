import 'package:flutter/material.dart';
import 'package:ride_halling_rider/ui/splash/splashScreen.dart';

import 'constant/appTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: themeData,
     home: SplashScreen(),
    );
  }
}

