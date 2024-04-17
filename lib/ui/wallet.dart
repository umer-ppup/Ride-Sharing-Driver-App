import 'package:flutter/material.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/screenSize/screenSize.dart';
import 'package:ride_halling_rider/widget/widgets.dart';

class wallet extends StatefulWidget {
  @override
  _walletState createState() => _walletState();
}

class _walletState extends State<wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white[100],
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(Assets.monye,  width: MediaQuery.of(context).size.width,
              height: ScreenSizeResponsive.screenHeight(context, dividedBy: 2.5),),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child:Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.grey[100],
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Total Earning',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            SizedBox(height: 10.0,),
                            Text('Rs : 2000',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      )),
                  SizedBox(width: 10.0,),
                  Expanded(
                      child:Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.grey[100],
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Total Rides',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            SizedBox(height: 10.0,),
                            Text('2000',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Expanded(
                      child:Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.grey[100],
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Today's Earning",style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            SizedBox(height: 10.0,),
                            Text('Rs : 2000',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      )),
                  SizedBox(width: 10.0,),
                  Expanded(
                      child:Container(
                        height: 150.0,
                        decoration: BoxDecoration(
                          color:Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16.0),
                            topRight: Radius.circular(16.0),
                            bottomLeft: Radius.circular(16.0),
                            bottomRight: Radius.circular(16.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey[400],
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.grey[100],
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child:  Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Company Dues',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.black),),
                            SizedBox(height: 10.0,),
                            Text('Rs : 2000',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                          ],
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
