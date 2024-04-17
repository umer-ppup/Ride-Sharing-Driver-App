import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/localjson/localjson.dart';
import 'package:ride_halling_rider/screenSize/screenSize.dart';
import 'package:ride_halling_rider/ui/loginPage.dart';
import 'package:ride_halling_rider/widget/widgets.dart';
import 'otpScreen.dart';
import 'package:ride_halling_rider/Models/signUpRequestModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signUpScreen extends StatefulWidget {
  @override
  _signUpScreenState createState() => _signUpScreenState();
}

class _signUpScreenState extends State<signUpScreen> {
  // Item selectedUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    signupname =TextEditingController();
    password =TextEditingController();
    phone =TextEditingController();
    email =TextEditingController();
    car_no =TextEditingController();
    nic_no =TextEditingController();
    license_no =TextEditingController();
  }
  List data;
  String mystate;
  TextEditingController email, password, phone, signupname,car_no,nic_no,license_no;
  ProgressDialog pr;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Waiting...',
        borderRadius: 5.0,
        backgroundColor: AppColors.white[100],
        progressWidget: SpinKitFadingCircle(color: AppColors.black[100]),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
          color: AppColors.black[100],
          fontSize: 10.0,
          fontWeight: FontWeight.w400,
        ),
        messageTextStyle: TextStyle(
          color: AppColors.black[100],
          fontSize: 14.0,
          fontWeight: FontWeight.w600,
        )
    );
    final node = FocusScope.of(context);
    return Scaffold(
      body: Container(
        color: AppColors.white[100],
        alignment: Alignment.center,
        child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: SafeArea(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          Image.asset(Assets.signupanimation,
                            width: MediaQuery.of(context).size.width,
                            height: ScreenSizeResponsive.screenHeight(context, dividedBy: 3),),
                          signUpformField(signupname, 'John Doe',false),
                          SizedBox(
                            height: 10.0,
                          ),
                          formtextField(email, 'Enter Email',false),
                          SizedBox(
                            height: 10.0,
                          ),
                          formtextField(password, 'Enter Password',true),
                          SizedBox(
                            height: 10.0,
                          ),
                          signUpformField(phone, 'Enter Phone',false),
                          SizedBox(height: 10.0,),

                          signUpformField(car_no, 'Enter Car no',false),
                          SizedBox(
                            height: 10.0,
                          ),

                          signUpformField(nic_no, 'Enter CNIC no',false),
                          SizedBox(
                            height: 10.0,
                          ),

                          signUpformField(license_no, 'Enter License no',false),
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            height: 50.0,
                            width: MediaQuery
                                .of(context)
                                .size
                                .width,
                            decoration: BoxDecoration(
                                color: AppColors.black[100],
                                borderRadius: BorderRadius.circular(5.0)),
                            child: MaterialButton(
                              onPressed: (){
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();
                                  pr.show();
                                  Storage.readData().then((value) async {
                                    if(value != ""){
                                      signUpPostModel user = signUpPostModel.fromJson(json.decode(value));
                                      if(user.email != email.text){
                                        signUpPostModel user = new signUpPostModel(
                                            name: signupname.text,
                                            email: email.text,
                                            password: password.text,
                                            phone: phone.text,
                                            car_no: car_no.text,
                                            nic_no: nic_no.text,
                                            license_no: license_no.text,
                                        );
                                        await Storage.writeData(json.encode(user));
                                        await pr.hide();
                                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                        Fluttertoast.showToast(
                                            msg: "Succesfully Register",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: AppColors.white[100],
                                            textColor: AppColors.black[100],
                                            fontSize: 16.0
                                        );
                                      }
                                      else{
                                        newmrthod();
                                        Fluttertoast.showToast(
                                            msg: "Error: Email already exists.",
                                            toastLength: Toast.LENGTH_SHORT,
                                            gravity: ToastGravity.BOTTOM,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: AppColors.white[100],
                                            textColor: AppColors.black[100],
                                            fontSize: 16.0
                                        );
                                      }
                                    }
                                    else{
                                      signUpPostModel user = new signUpPostModel(
                                        name: signupname.text,
                                        email: email.text,
                                        password: password.text,
                                        phone: phone.text,
                                        car_no: car_no.text,
                                        nic_no: nic_no.text,
                                        license_no: license_no.text,
                                      );
                                      await Storage.writeData(json.encode(user));
                                     newmrthod();
                                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                    }
                                  });

                                  // signUpPostModel  newSignUpRequest = new signUpPostModel(
                                  //     name: name.text, email: email.text, password: password.text,phone: phone.text);
                                  // signUpPostRequest('CREATE_loginPost_URL', body: newSignUpRequest.toMap()).then((value){
                                  //   if(value == 'success'){
                                  //     pr.hide();
                                  //     Fluttertoast.showToast(
                                  //         msg: "Success",
                                  //         toastLength: Toast.LENGTH_SHORT,
                                  //         gravity: ToastGravity.BOTTOM,
                                  //         backgroundColor: AppColors.white[100],
                                  //         textColor: AppColors.black[100],
                                  //         fontSize: 16.0);
                                  //     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                                  //   }else{
                                  //     pr.hide();
                                  //     Fluttertoast.showToast(
                                  //         msg: "Failed",
                                  //         toastLength: Toast.LENGTH_SHORT,
                                  //         gravity: ToastGravity.BOTTOM,
                                  //         backgroundColor: AppColors.white[100],
                                  //         textColor: AppColors.black[100],
                                  //         fontSize: 16.0);
                                  //   }
                                  // });
                                }
                              },
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.white[100],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Already Have a Account",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.0,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) =>
                                            LoginPage()));
                                  },
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color:AppColors.black[100],
                                        fontSize: 13.0,
                                        decoration: TextDecoration.underline,
                                        fontFamily: 'Lily'),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
        ),
      ),


    );
  }

  void method() {
    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => OtpScreen())));
    pr.hide();
  }
  void newmrthod() async{
    await pr.hide();
  }
}

