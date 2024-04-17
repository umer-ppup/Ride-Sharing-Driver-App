import 'package:flutter/material.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';
import 'package:ride_halling_rider/widget/widgets.dart';

showAlertDialog(BuildContext context) {
  Widget launchButton = FlatButton(
    child: Text(
      "Ok",
      style: TextStyle(
          color: Colors.blue,
          fontWeight: FontWeight.bold,
          fontFamily: 'Lily'),
    ),
    onPressed: () {
      Navigator.pop(context);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: AppColors.white[100],
    title: textwidgetbold(
      "Notification",
       Assets.font1,
    ),
    content: textwidgetbold(
      Secrets.status ? "Now you are Live":"Now You are offline" ,
      Assets.font2
    ),
    actions: [
      launchButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}


