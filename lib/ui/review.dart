import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/screenSize/screenSize.dart';
import 'package:ride_halling_rider/widget/widgets.dart';


class reviewScreen extends StatefulWidget {
  @override
  _reviewScreenState createState() => _reviewScreenState();
}

class _reviewScreenState extends State<reviewScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeData(color: AppColors.white[100]),
        title: whitecolortextwidget('Give Review'),
      ),
      body: Container(
        color: AppColors.white[100],
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Assets.reviewanimation,
                width: MediaQuery.of(context).size.width,
                height:
                ScreenSizeResponsive.screenHeight(context, dividedBy: 3),
              ),
             SizedBox(height: 10.0,),
              Container(
                height: 150.0,
                width: MediaQuery.of(context).size.width,
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
                    Text('Total Fare',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                    SizedBox(height: 10.0,),
                    Text('PKR : 2000',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                  ],
                ),
              ),
              SizedBox(height: 10.0,),
              Container(
                padding: EdgeInsets.all(20.0),
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
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('To : ',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                       Text('Tokar niaz baig',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                     ],
                   ),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('From : ',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                        Text('Johar Town Lahore',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                      ],
                    ),

                    SizedBox(height: 10.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Km : ',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                        Text('7 KM',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                      ],
                    ),

                    SizedBox(height: 10.0,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Time For arrival : ',style: TextStyle(fontSize: 18.0,color: Colors.black),),
                        Text('20 mint',style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black),),
                      ],
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
