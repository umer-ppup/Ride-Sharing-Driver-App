import 'package:flutter/material.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/constant/varaibleAssets.dart';
import 'package:ride_halling_rider/widget/widgets.dart';
import 'package:rating_bar/rating_bar.dart';

class riderReview extends StatefulWidget {
  @override
  _riderReviewState createState() => _riderReviewState();
}

class _riderReviewState extends State<riderReview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: whitecolortextwidget('Reviews'),
          iconTheme: IconThemeData(color: AppColors.white[100]),
          brightness: Brightness.dark,
        ),
        body:Padding(
          padding: EdgeInsets.all(15.0),
          child: SafeArea(
            child: Container(
              height: 145.0,
              decoration: BoxDecoration(
                color: AppColors.white[100],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  SizedBox(
                    width: 80,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.grye[200],
                          borderRadius: BorderRadius.circular(15),
                        ),
                        padding: EdgeInsets.all(10),
                        child: Image.asset(Assets.reviewanimation,),
                      ),

                    ),
                  ),
                  SizedBox(width: 20),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Row(
                              children: [
                                    Icon(Icons.supervised_user_circle_outlined,color: AppColors.black[100],size: 20.0,),
                                    SizedBox(width: 3.0,),
                                    textwidgetbold("Raja Rizwan".toString(),Assets.font4),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 3.0,),
                        Row(
                         children: [
                           SizedBox(width: 21.0,),
                           RatingBar(
                             onRatingChanged: (rating) => setState(() => Secrets.ratingTotal = rating),
                             filledIcon: Icons.emoji_emotions,
                             emptyIcon: Icons.emoji_emotions_outlined,
                             filledColor: AppColors.deepPurple[50],
                             emptyColor: AppColors.black[100],
                             size: 15,
                           ),
                         ],
                        ),
                        SizedBox(height: 5.0,),
                        SizedBox(
                            width: 200.0,
                            child: Text('Hamza iqbal is very good driver.im travel'
                                ' with hamza many times.i recommend you all to travel'
                                ' with hamza',
                                overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                color: AppColors.black[100], fontSize: 14.0,),)
                        )],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}

