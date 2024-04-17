import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:ride_halling_rider/constant/appcolor.dart';
import 'package:ride_halling_rider/constant/assets.dart';
import 'package:ride_halling_rider/screenSize/screenSize.dart';
import 'package:ride_halling_rider/ui/signUp.dart';
import 'package:ride_halling_rider/widget/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:ride_halling_rider/localjson/localjson.dart';
import 'homepage.dart';
import 'package:ride_halling_rider/Models/loginModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextEditingController name, password;
  ProgressDialog pr;
  double height,width;
  final _formKey = GlobalKey<FormState>();

  //region initial state of screen
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name = TextEditingController();
    password = TextEditingController();

  }

  //endregion


  @override
  Widget build(BuildContext context) {

    //region progress dialouge
    pr = new ProgressDialog(context);
    pr.style(
        message: 'Please Wait...',
        borderRadius: 5.0,
        backgroundColor:  AppColors.white[100],
        progressWidget: SpinKitFadingCircle(color: AppColors.black[100],),
        elevation: 10.0,
        insetAnimCurve: Curves.easeInOut,
        progress: 0.0,
        maxProgress: 100.0,
        progressTextStyle: TextStyle(
            color: AppColors.black[100], fontSize: 10.0, fontWeight: FontWeight.w400),
        messageTextStyle: TextStyle(
            color: AppColors.black[100], fontSize: 14.0, fontWeight: FontWeight.w600)
    );
    //endregion

    //region screen design of login page
    return Scaffold(
      //region body of the screen
      body: Container(
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        color: AppColors.white[100],
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset(Assets.loginpageanimation,height: ScreenSizeResponsive.screenHeight(context, dividedBy: 3),
                    width: MediaQuery.of(context).size.width),
                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[

                      textwidgetbold(Assets.welcometxt,Assets.font1),
                      SizedBox(height: 10.0,),
                      textwidget(Assets.guidetxt,Assets.font1),

                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    children: <Widget>[
                      formtextField(name, 'Enter Email',false),
                      SizedBox(height: 15.0,),
                      formtextField(password, 'Enter password',true),
                      SizedBox(height: 15.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          InkWell(
                            onTap: (){
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPassword()));
                            },
                            child: Text(
                              Assets.loginforgetpasswordtxt,
                              style: TextStyle(
                                  color:  AppColors.black[100],
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Container(
                        height:55.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: AppColors.black[100],
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: MaterialButton(
                          onPressed:(){
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              pr.show();
                              Storage.readData().then((value) async {
                                if(value != ""){
                                  loginPost user = loginPost.fromJson(json.decode(value));
                                  if(user.email == name.text && user.password == password.text){
                                    setState(() {
                                       pr.hide();
                                    });
                                    method();
                                  }
                                  else {
                                   newmrthod();
                                    Fluttertoast.showToast(
                                        msg: "Error: Login failed.",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: AppColors.white[100],
                                        textColor: AppColors.black[100],
                                        fontSize: 16.0
                                    );
                                  }
                                }
                              });

                              // loginPost newloginPost = new loginPost(userId: Secrets.userId, email: email.text, password: password.text);
                              // loginpostRequest('CREATE_loginPost_URL', body: newloginPost.toMap()).then((value){
                              //   pr.hide();
                              // });
                            }
                          } ,
                          child:Center(
                            child: Text("Login",style: TextStyle(fontWeight: FontWeight.bold,color: AppColors.white[100],
                            ),),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      InkWell(
                        onTap: () async{
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) => signUpScreen()));
                        },
                        child: Text(
                          Assets.loginpagecreatenewaccounttxt,
                          style: TextStyle(
                              color: AppColors.black[100],
                              fontSize: 13.0,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //endregion
    );
    //endregion
  }
  void method() async{
    SharedPreferences prefs= await SharedPreferences.getInstance();
    prefs.setString('login', '1');
    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => homePage()));
  }

  void newmrthod() async{
    await pr.hide();
  }
}