import 'package:flutter/material.dart';
import 'package:ride_halling_rider/constant/fontfamily.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';


final ThemeData themeData = new ThemeData(

    fontFamily: FontFamily.popin,

    brightness: Brightness.dark,

    primaryColor: AppColors.black[100],

    primaryColorBrightness: Brightness.light,

    accentColor: AppColors.orange[500],

    accentColorBrightness: Brightness.light

);

final ThemeData themeDataDark = ThemeData(

  fontFamily: FontFamily.popin,

  brightness: Brightness.dark,

  primaryColor: AppColors.orange[500],

  primaryColorBrightness: Brightness.dark,

  accentColor: AppColors.orange[500],

  accentColorBrightness: Brightness.dark,

);