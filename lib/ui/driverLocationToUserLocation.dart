import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_map_polyline/google_map_polyline.dart';
import 'package:ride_halling_rider/widget/widgets.dart';


class DriverToUser extends StatefulWidget {
  @override
  _DriverToUserState createState() => _DriverToUserState();
}
//region Drive to user screen state function
class _DriverToUserState extends State<DriverToUser> {

  Position current =Position(latitude:Secrets.currentPosition.latitude,longitude:Secrets.currentPosition.longitude);
  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  //region initial state
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    polulinefortrackrider(current , Secrets.positionjj);
    _getCurrentLocation();
  }
  //endregion
  //region Driver to user location map screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            markers: Secrets.movetouser != null
                ? Set<Marker>.from( Secrets.movetouser)
                : null,
            polylines: Set<Polyline>.of(Secrets.trackpolylines.values),
            initialCameraPosition: Secrets.initialLocation,
            // myLocationEnabled: true,
            myLocationButtonEnabled: false,
            mapType: MapType.normal,
            compassEnabled: true,
            tiltGesturesEnabled: false,
            zoomGesturesEnabled: true,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              Secrets.moveToUserMapController = controller;

            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.black[100],
        onPressed: () async{
          trackRiderBottomAppBar(context);
          // await mobx.polulinefortrackrider(position,desti);
        },
        icon: Icon(Icons.arrow_drop_up_outlined,size: 40.0,color: AppColors.white[100],),
        label: whitecolortextwidget("Tap to see all information"),
      ),
    );
  }

  //endregion



//region draw polyline method on map
  Future<void> polulinefortrackrider(Position start, Position destination) async {
    Secrets.trackpolylinePoints = PolylinePoints();
    PolylineResult result = await  Secrets. trackpolylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(start.latitude, start.longitude),
      PointLatLng(destination.latitude, destination.longitude),
      travelMode: TravelMode.driving,
    );

    GoogleMapPolyline googleMapPolyline =
    GoogleMapPolyline(apiKey: Secrets.API_KEY);
    List<LatLng> re = await googleMapPolyline.getCoordinatesWithLocation(
        origin: LatLng(start.latitude, start.longitude),
        destination: LatLng(destination.latitude, destination.longitude),
        mode: RouteMode.driving);
    if (re.isNotEmpty) {
      print("track cheak" +  Secrets.trackpolylineCoordinates.length.toString());
      re.forEach((element) {
        print('track polyline');
        setState(() {
          Secrets.trackpolylineCoordinates.add(LatLng(element.latitude, element.longitude));
        });
      });
    }

    print("track cheak1" +  Secrets.trackpolylineCoordinates.length.toString());
    print("track poins length" + re.length.toString());
    PolylineId id = PolylineId('new');
    Polyline polyline = Polyline(
      polylineId: id,
      color: AppColors.black[100],
      points:  Secrets.trackpolylineCoordinates,
      width: 6,
    );
    setState(() {
      Secrets.trackpolylines[id] = polyline;
    });
    polyline.points.forEach((element) {
      print("new kre" + element.toString());
    });
  }
//endregion

  //region place marker on map according to location
  void placemarker(Position position) {
    LatLng latLng =LatLng(Secrets.dono.latitude, Secrets.dono.longitude);

    Marker driver = Marker(
        markerId: MarkerId('driver'),
        position: LatLng(
          latLng.latitude,
          latLng.longitude,
        ),
        draggable: false,
        flat: true,
        rotation: Secrets.dono.heading,
        anchor: Offset(0.5,0.5),
        icon: Secrets.Haze1);

    Marker user = Marker(
        markerId: MarkerId('user'),
        position: LatLng(
          position.latitude,
          position.longitude,
        ),
        draggable: false,
        flat: true,
        rotation: position.heading,
        anchor: Offset(0.5,0.5),
        icon: Secrets.usericon);
    setState(() {
      Secrets.movetouser.add(driver);
      Secrets.movetouser.add(user);
    });
  }
//endregion

  //region get current location with lat lng stream
  _getCurrentLocation() async {
    print("HAmmmmza");
    await geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) async {
      print("HAMza");
      setState(() {
        Secrets.dono = position;
        geolocator.getPositionStream().listen((event) {
          print("track" + event.toString());
          setState(() {
            Secrets.dono = event;
            placemarker(Secrets.positionjj);
          });
        });
        Secrets.moveToUserMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(Secrets.dono.latitude, Secrets.dono.longitude),
              zoom: 18,
            ),
          ),
        );
      });
    }).catchError((e) {
      print(e);
    });
  }
  //endregion

}

//endregion
