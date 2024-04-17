import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';

class SecondTab extends StatefulWidget {
  @override
  _SecondTabState createState() => _SecondTabState();
}
//region second tab ui
class _SecondTabState extends State<SecondTab> {
  List<LatLng> polygonLatLngs = List<LatLng>();
  CameraPosition _cameraPosition;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setPolygon();
  }
  @override
  Widget build(BuildContext context) {
    //region start design
    return Scaffold(
      body: Stack(
        children: [
          //region Google map screen
          GoogleMap(
            polygons: Secrets.polygons,
            initialCameraPosition: Secrets.initialLocation,
            // myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              Secrets.polygonecontroller = controller;
              Secrets.polygonecontroller.animateCamera(
                CameraUpdate.newCameraPosition(
                  _cameraPosition
                ),
              );
            },
          ),

          //endregion
        ],
      ),
    );
    //endregion
  }



  void setPolygon(){
    final String polygonIdVal = 'polygon_id_';
    polygonLatLngs.add(LatLng(31.471600490522185, 74.27767731249332));
    polygonLatLngs.add(LatLng(31.478339389178036, 74.27618265151978));
    polygonLatLngs.add(LatLng(31.480173651272818, 74.28100023418665));
    polygonLatLngs.add(LatLng(31.478309651819064, 74.28172241896391));
    for(int i = 0; i < polygonLatLngs.length; i++){
      Secrets.polygons.add(
          Polygon(
            polygonId: PolygonId(polygonIdVal),
            points: polygonLatLngs,
            strokeWidth: 2,
            strokeColor: AppColors.black[100],
            fillColor: AppColors.black[400],
          )
      );
    }
    setState(() {
      _cameraPosition = CameraPosition(target: LatLng(polygonLatLngs[0].latitude, polygonLatLngs[0].longitude),zoom: 15.0);
    });
  }

}

//endregion
