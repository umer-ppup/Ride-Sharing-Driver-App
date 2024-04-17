import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';
import 'package:ride_halling_rider/ui/driverLocationToUserLocation.dart';
import 'package:ride_halling_rider/ui/review.dart';
import 'package:ride_halling_rider/ui/userLocationToDestinatio.dart';

Widget textwidget(String txt, double adjustfont) {
  return Text(txt,
    overflow: TextOverflow.fade,
    maxLines: 2,
    softWrap: false, style: TextStyle(
    color: AppColors.black[100], fontSize: adjustfont,),);
}


Widget textwidgetbold(String txt, double adjustfont) {
  return Text(txt,
    overflow: TextOverflow.fade,
    maxLines: 2,
    softWrap: false,style: TextStyle(
      color: AppColors.black[100], fontSize: adjustfont,fontWeight: FontWeight.bold),);
}

Widget whitecolortextwidget(String txt) {
  return Text(txt,
    overflow: TextOverflow.fade,
    maxLines: 2,
    softWrap: false,style: TextStyle(
        fontWeight: FontWeight.bold, color: AppColors.white[100]),);
}



Widget formtextField(TextEditingController textediting, String hint, bool value) {
  return TextFormField(
    style: TextStyle(color: AppColors.black[100]),
    controller: textediting,
    textInputAction: TextInputAction.next,
    obscureText: value,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grye[100],
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:AppColors.black[100],
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
      alignLabelWithHint: true,
      labelText: hint,
      labelStyle: TextStyle(
        fontSize: 16,
        color: AppColors.black[100],
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),

    validator: (textediting) {
      if (textediting.isEmpty) {
        return 'Fill The Field';
      } else if (hint == 'Enter Email' ?!Assets.kEmailValidatorRegExp.hasMatch(textediting):
      !Assets.kPasswordValidatorRegExp.hasMatch(textediting)) {
        return null;
      } else {
        return null;
      }
    },
  );
}


Widget signUpformField(TextEditingController textediting, String hint, bool value) {
  return TextFormField(
    style: TextStyle(color: AppColors.black[100]),
    controller: textediting,
    textInputAction: TextInputAction.next,
    autofocus: true,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.grye[100],
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color:AppColors.black[100],
        ),
      ),
      border: OutlineInputBorder(
          borderRadius: const BorderRadius.all(const Radius.circular(10.0))),
      alignLabelWithHint: true,
      labelText: hint,
      labelStyle: TextStyle(
        fontSize: 16,
        color: AppColors.black[100],
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
    ),

    validator: (textediting) {
      if (textediting.isEmpty) {
        return 'Fill The Field';
      } else if (hint == 'Enter Phone' ?!Assets.kPhoneValidatorRegExp.hasMatch(textediting):
      textediting.length < 2) {
        return 'Invalid Format';
      } else {
        return null;
      }
    },
  );
}


trackRiderBottomAppBar(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            color: AppColors.black[100],
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 30,
                ),
                SizedBox(
                    height: 270.0,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: AppColors.white[100],
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          // overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                                  border: Border.all(
                                      color: Color(0xff232f34), width: 10),
                                ),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.asset(
                                      Assets.loginpageanimation,
                                      height: 46.0, width: 46.0,),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                padding: EdgeInsets.only(
                                    top: 30.0, right: 15.0, left: 15.0),
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Expanded(
                                        child: textwidgetbold(
                                            'TO :  ', Assets.font2),
                                      ),
                                      Expanded(
                                        child:  textwidget(
                                            'Thoakr niaz baig', Assets.font1),
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: textwidgetbold(
                                            'From :  ', Assets.font2),
                                      ),
                                      Expanded(
                                        child:textwidget(
                                            "Johar town",
                                            Assets.font1),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      textwidget(
                                          'Captain Name :', Assets.font1),
                                      textwidgetbold(
                                          'Hamza iqbal', Assets.font1),
                                    ],
                                  ),

                                  SizedBox(height: 10.0,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      textwidget(
                                          'Expected Time', Assets.font1),
                      textwidgetbold("15 mint",Assets.font1)
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          textwidget(
                                              'phn :', Assets.font1),
                                          textwidget(
                                              ' 0306757575', Assets.font1),
                                        ],
                                      ),
                                      CircleAvatar(
                                          backgroundColor: AppColors
                                              .black[100],
                                          radius: 20,
                                          child: Icon(Icons.phone,
                                            color: AppColors
                                                .white[100],) //Text
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    children: [
                                      mapStratAndCancelButton(
                                          'Start Ride', context,
                                          AppColors.red[100],2),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                    )),

              ],
            ),
          ),
        );
      });
}


rideconfirmationBottomScreen(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            color: AppColors.black[100],
          ),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 30,
                ),
                SizedBox(
                    height: 170.0,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: AppColors.white[100],
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          // overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                                  border: Border.all(
                                      color: Color(0xff232f34), width: 10),
                                ),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.asset(
                                      Assets.loginpageanimation,
                                      height: 46.0, width: 46.0,),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                padding: EdgeInsets.only(
                                    top: 30.0, right: 15.0, left: 15.0),
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Expanded(
                                        child: textwidgetbold(
                                            'TO :  ', Assets.font2),
                                      ),
                                      Expanded(
                                        child:  textwidget(
                                            'Johar Town Lahore', Assets.font1),
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: textwidgetbold(
                                            'From :  ', Assets.font2),
                                      ),
                                      Expanded(
                                        child:textwidget(
                                          'Thokar Niaz Baig',
                                            Assets.font1),
                                      ),
                                    ],
                                  ),

                                  SizedBox(height: 10.0,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    children: [
                                      mapStratAndCancelButton(
                                          'Pick Ride', context,
                                          AppColors.black[100],1),
                                      mapStratAndCancelButton(
                                          'Cancel Ride', context,
                                          AppColors.red[100],1),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                    )),

              ],
            ),
          ),
        );
      });
}



Widget completeRideButton(String txt, BuildContext context, Color color) {
  return ButtonTheme(
    minWidth: MediaQuery
        .of(context)
        .size
        .width / 1.5,
    height: 55.0,
    child: RaisedButton(
      padding: const EdgeInsets.all(8.0),
      color: color,
      onPressed: () {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>reviewScreen()));
      },
      child: whitecolortextwidget(txt),
    ),
  );
}



drivewithCaptainBottomsheet(context) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            color: Colors.black,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Container(
                  height: 30,
                ),
                SizedBox(
                    height: 275.0,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                          ),
                          color: AppColors.white[100],
                        ),
                        child: Stack(
                          alignment: Alignment(0, 0),
                          // overflow: Overflow.visible,
                          children: <Widget>[
                            Positioned(
                              top: -36,
                              child: Container(

                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(50)),
                                  border: Border.all(
                                      color: Color(0xff232f34), width: 10),
                                ),
                                child: Center(
                                  child: ClipOval(
                                    child: Image.asset(
                                      Assets.loginpageanimation,
                                      height: 46.0, width: 46.0,),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              child: ListView(
                                padding: EdgeInsets.only(
                                    top: 30.0, right: 15.0, left: 15.0),
                                physics: NeverScrollableScrollPhysics(),
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Expanded(
                                        child: textwidgetbold(
                                            'TO :  ', Assets.font2),
                                      ),
                                      Expanded(
                                        child:  textwidget(
                                            "Thokar niaz baig", Assets.font1),
                                      )
                                    ],
                                  ),

                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: textwidgetbold(
                                            'From :  ', Assets.font2),
                                      ),
                                      Expanded(
                                        child:textwidget(
                                            "Johar town lahore",
                                            Assets.font1),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                        child: textwidget(
                                            'Captain Name :', Assets.font1),
                                      ),
                                      Expanded(
                                        child: textwidgetbold(
                                            'Hamza iqbal', Assets.font1),
                                      )

                                    ],
                                  ),

                                  SizedBox(height: 10.0,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                        child: textwidget(
                                            'Expected Time', Assets.font1),
                                      ),
                                      Expanded(
                                        child:  textwidgetbold(
                                           "15 mint", Assets.font1),
                                      )


                                    ],
                                  ),
                                  SizedBox(height: 10.0,),

                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Expanded(
                                        child: textwidget(
                                            'Total Fear :', Assets.font1),
                                      ),
                                      Expanded(
                                        child:textwidgetbold(
                                           "250", Assets.font1),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .center,
                                    children: [
                                      completeRideButton(
                                          'End Ride', context,
                                          AppColors.black[100]),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                    )),
              ],
            ),
          ),
        );
      });
}


Widget mapStratAndCancelButton(String txt, BuildContext context, Color color,int num) {
  return ButtonTheme(
    minWidth: MediaQuery
        .of(context)
        .size
        .width / 2.5,
    height: 55.0,
    child: RaisedButton(
      padding: const EdgeInsets.all(8.0),
      color: color,
      onPressed: () {
        if(num == 1){
       Navigator.push(context, MaterialPageRoute(builder: (context)=> DriverToUser()));
        }if(num == 2){
          Navigator.push(context, MaterialPageRoute(builder: (context)=> startTodes()));
        }
      },
      child: whitecolortextwidget(txt),
    ),
  );
}