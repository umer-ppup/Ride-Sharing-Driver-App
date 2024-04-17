//region bottom navigation bar items code
import 'package:ride_halling_rider/TabsUi/secondTab.dart';
import 'package:ride_halling_rider/ui/homepage.dart';
import 'package:ride_halling_rider/ui/wallet.dart';

import 'FirstTabUi.dart';
import 'package:flutter/material.dart';


List<Widget> BOttomNavigationChilds = <Widget>[
  FirstTab(),
  SecondTab(),
  wallet(),
];
//endregion