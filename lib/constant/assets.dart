
class Assets {

  Assets._();

  static final kEmailValidatorRegExp = RegExp(
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
  static final kPasswordValidatorRegExp =
  RegExp(r"^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$");
  static final RegExp kPhoneValidatorRegExp =
  RegExp(r"^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$");


  // splash screen assets
  static double font1= 15.0;
  static double font4= 13.0;
  static double font2= 18.0;
  static double font3= 20.0;
  static const String splashcaranimation = "assets/animations/splashscreen.gif";
  static const String atrulelogo = "assets/images/atrulelogo.png";


  // login screen assets
  static const String loginpageanimation = "assets/animations/loginanimation.gif";
  static String welcometxt = "Welcome To  Ride Hilling";
  static String guidetxt = "Enter Yout Email and Password and Book A Ride";
  static String loginforgetpasswordtxt = "Forget Password ?";
  static String loginpagecreatenewaccounttxt = "Create New Account";

  // Sign Up screen assets
  static const String signupanimation = "assets/animations/signupanimation.gif";


  //OTP Screen
  static const String otpanimation = "assets/animations/otpanimation.gif";
  static const String otptxt = "OTP Verification";
  static const String otpnotsend = "if you didn't racive the code";
  static const String resend = "Resend";
  static const String buttontext = "Submit";
  static const String otpguide = "Cheak your SMS messages we have sent you the verification code ";

  //Home Screen
  static const String Appname = "Ride Sharing";
  static const String caricon = "assets/images/car.png";
  static const String newcaricon = "assets/icons/projectcar.png";
  static const String newusericon = "assets/icons/usericon.png";
  static const String draweranimation = "assets/animations/draw.gif";
  static const String bell = "assets/icons/bell.svg";
  static const String camera = "assets/icons/camera.svg";
  static const String help = "assets/icons/help.svg";
  static const String setting = "assets/icons/setting.svg";
  static const String logout = "assets/icons/logout.svg";
  static const String user = "assets/icons/user.svg";
  static String profileimage='assets/images/profile.png';


  //wallet Screen
  static String monye='assets/animations/monye.gif';
  static const String reviewanimation = "assets/animations/animation.gif";
}