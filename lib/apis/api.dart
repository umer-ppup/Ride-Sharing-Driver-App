import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';
import 'package:http/http.dart' as https;
import 'package:ride_halling_rider/Models/orderHistoryModel.dart';


//region get previous rides of the rider
Future previousRideGetRequest(String url) async {
  if(Secrets.conditionCheak){
    return https.get(url).then((https.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return completeRideModel.fromJson(json.decode(response.body));
    });
  }else{
    final String response = await rootBundle.loadString('assets/data.json');
    var data = await json.decode(response);
    var result = data["RideHistory"] as List;
    print('hahaha'+result.length.toString());
    var dataList = result.map<completeRideModel>((json) => completeRideModel.fromJson(json)).toList();
    return dataList;
  }
}

//endregion