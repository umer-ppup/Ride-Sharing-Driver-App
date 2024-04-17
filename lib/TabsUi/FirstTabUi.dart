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
import 'package:ride_halling_rider/ui/loginPage.dart';
import 'package:ride_halling_rider/widget/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstTab extends StatefulWidget {
  @override
  _FirstTabState createState() => _FirstTabState();
}

//region first tab ui
class _FirstTabState extends State<FirstTab> {
  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentLocation();

  }
  @override
  Widget build(BuildContext context) {
    //region Firs tab ui
    return Scaffold(
      body:Stack(
        children: <Widget>[
          //region Map View
          GoogleMap(
            markers: Secrets.markers != null
                ? Set<Marker>.from( Secrets.markers)
                : null,
            initialCameraPosition: Secrets.initialLocation,
            // myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              Secrets.mapController = controller;
              Secrets.mapController.animateCamera(
                CameraUpdate.newCameraPosition(
                  CameraPosition(
                    target: LatLng(Secrets.currentPosition.latitude, Secrets.currentPosition.longitude),
                    zoom: 18,
                  ),
                ),
              );
            },
          ),

          //endregion
          //region zoom in and zoom out function
          Secrets.bottomsheetenableornot != true
              ? SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipOval(
                    child: Material(
                      color: AppColors.black[100], // button color
                      child: InkWell(
                        splashColor: AppColors.black[100],
                        // inkwell color
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.add,
                            color: AppColors.white[100],
                          ),
                        ),
                        onTap: () {
                          Secrets.mapController.animateCamera(
                            CameraUpdate.zoomIn(),
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ClipOval(
                    child: Material(
                      color: AppColors.black[100], // button color
                      child: InkWell(
                        splashColor: AppColors.black[100],
                        // inkwell color
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: Icon(
                            Icons.remove,
                            color: AppColors.white[100],
                          ),
                        ),
                        onTap: () {
                          Secrets.mapController.animateCamera(
                            CameraUpdate.zoomOut(),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
          : Container(),
          //endregion
        ],
      ),
    );
    //endregion,
  }

  getCurrentLocation() async {
    print("HAmmmmza");
    await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      print("HAMza");
      setState(() {
        Secrets.currentPosition = position;
        putmarker(Secrets.currentPosition);
        Secrets.mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(Secrets.currentPosition.latitude, Secrets.currentPosition.longitude),
              zoom: 18,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }

  //region putmarker on maps
  void putmarker(Position currentPosition) {
    LatLng latLng =LatLng(Secrets.currentPosition.latitude, Secrets.currentPosition.longitude);
    Marker aaa = Marker(
        markerId: MarkerId('1'),
        position: LatLng(
          currentPosition.latitude,
          currentPosition.longitude,
        ),
        draggable: false,
        flat: true,
        icon: Secrets.Clear1);
    Circle newcir = Circle(
      circleId: CircleId('one'),
      radius: currentPosition.accuracy,
      zIndex: 1,
      center: latLng,
      fillColor: Colors.blue.withAlpha(70),
    );
    setState(() {
      Secrets.markers.add(aaa);
      Secrets.circle.add(newcir);
    });
  }
//endregion


}
//endregion
