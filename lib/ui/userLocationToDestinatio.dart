import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';
import 'package:ride_halling_rider/widget/widgets.dart';

class startTodes extends StatefulWidget {
  @override
  _startTodesState createState() => _startTodesState();
}

class _startTodesState extends State<startTodes> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      drivewithCaptainBottomsheet(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: Secrets.startTodes != null
                ? Set<Marker>.from( Secrets.startTodes)
                : null,
            polylines: Set<Polyline>.of(Secrets.startTodespolylines.values),
            initialCameraPosition: Secrets.initialLocation,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              Secrets.startTodesMapController = controller;
              // Secrets.startTodesMapController.animateCamera(
              //     CameraUpdate.newCameraPosition(
              //       CameraPosition(
              //         target: LatLng(Secrets.currentPosition.latitude,Secrets.currentPosition.longitude),
              //         zoom: 16,
              //       ),
              //     ));
            },
          ),
        ],
      ),
    );
  }
}
