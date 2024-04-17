// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
class Secrets {
  // Add your Google Maps API Key here
  static const API_KEY = 'AIzaSyCTgG9bky31CZBNcTHTrjBvGl4vPdDPwcY';


  static const EstimatedTimeurl =  "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" ;
  static CameraPosition initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  static  GoogleMapController mapController;
  static  GoogleMapController moveToUserMapController;
  static  GoogleMapController polygonecontroller;
  static  GoogleMapController startTodesMapController;
  final Set<Polygon> _polygons = HashSet<Polygon>();
  static  BitmapDescriptor Haze1, Clear1, mist1, rainy1, cloud1, smoke1, elseno, startflag, desflag,usericon;

  static String currentAddress, startAddress,destinationAddress,esitimatedTime,trackriderTime ;
  static bool enable=false,showornot = true,routeshow = false;
  static  double CAMERA_ZOOM = 16;
  static double CAMERA_TILT = 80;
  static double pinPillPosition = -100;
  static double CAMERA_BEARING = 30;
  static String UserKmDistance;
  static String KmDistance = '50';
  static final startAddressController = TextEditingController();
  static final destinationAddressController = TextEditingController();
  static bool bottomsheetenableornot=false;
  static String userId,vechileId,paymentId,totalfear;
  static bool conditionCheak = false;
  static List items;
  static double ratingTotal;
  static TextEditingController submitreviewController;

  static Position currentPosition;

  static final Geolocator geolocator = Geolocator();

  static Set<Marker> markers = {};
  static Set<Marker> movetouser = {};
  static Set<Marker> startTodes = {};
  static Set<Polygon> polygons = {};
  static Map<PolylineId, Polyline> trackpolylines = {};
  static PolylinePoints trackpolylinePoints;
  static List<LatLng> trackpolylineCoordinates = [];
  static Map<PolylineId, Polyline> startTodespolylines = {};
  static PolylinePoints startTodespolylinePoints;
  static List<LatLng> startTodespolylineCoordinates = [];
  static bool status = false;
  static Position dono;

  static Position positionjj =Position(latitude: 31.47662453359844,longitude:74.2735904551365 );
  static Set<Circle> circle = {};
}