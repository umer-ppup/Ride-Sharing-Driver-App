import 'dart:async';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_halling_rider/Drawer/drawer.dart';
import 'package:ride_halling_rider/TabsUi/TabsAccordingIndex.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';
import 'package:ride_halling_rider/widget/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'loginPage.dart';

class homePage extends StatefulWidget {
  @override
  _homePageState createState() => _homePageState();
}
//region home screen stateful widget
class _homePageState extends State<homePage> {
  bool hide = false;
  int _selectedindex = 0;
  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  //region initial state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getprefs();

  }
  //endregion

  //region ontap funtion of tab
  ontap(int index) {
    setState(() {
      _selectedindex = index;
    });
  }
  //endregion

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;
    var width = MediaQuery
        .of(context)
        .size
        .width;
    //region screen design
    return Scaffold(
      drawer: NavDrawe(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.black[100],
        onTap: ontap,
        currentIndex: _selectedindex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.map_rounded,
                color: AppColors.white[100],
              ),
              label: 'Map'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.location_on,
                color: AppColors.white[100],
              ),
              label: 'Shift Area'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.wallet_travel_rounded,
              color: AppColors.white[100],
            ),
            label: 'Wallet',
          ),
        ],
        selectedItemColor: AppColors.white[100],
      ),
      appBar: AppBar(
        title: InkWell(
            onTap: (){
              rideconfirmationBottomScreen(context);
            },
            child: whitecolortextwidget(Assets.Appname)),
        iconTheme: IconThemeData(color: AppColors.white[100]),
        brightness: Brightness.dark,
      ),
      //region body of screen
      body:Center(
        //region bottoms according to tabs
        child: BOttomNavigationChilds.elementAt(_selectedindex),
        //endregion
      ),
      //endregion
    );
    //endregion
  }




  //region make icon accordin to wather
  void makeicons() async {
    final Uint8List markerIconc = await getBytesFromAsset(Assets.caricon, 150);
    final Uint8List newmarkerIconc = await getBytesFromAsset(Assets.newcaricon, 50);
    Secrets.Clear1 = BitmapDescriptor.fromBytes(markerIconc);
    Secrets.Haze1 = BitmapDescriptor.fromBytes(newmarkerIconc);
    final Uint8List usericon = await getBytesFromAsset(Assets.newusericon, 150);
    Secrets.usericon = BitmapDescriptor.fromBytes(usericon);
  }

//endregion

//region icon size adjust
  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

//endregion

  //region cheak login or not location
  void getprefs() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    String cheakLogin = prefs.getString('login');
    if(cheakLogin != '1'){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    }else{
      makeicons();
      Timer(
          Duration(seconds: 10),
              () => rideconfirmationBottomScreen(context)
      );
    }
  }
//endregion

}

//endregion