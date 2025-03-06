import 'package:flutter/material.dart';
import 'package:movies/main.dart';

class AppRoutes{
  static const String movieDetails ="movieDetails";
  static const String onBoarding = "onBoarding";
  static const String login = "login";
  static const String register = "register";
  static const String forgetPassword = "forgetPassword";
  static const String home = "home";
  static const String updateProfile = "updateProfile";
  static const String placeHolder = "/";

  static var routes ={
    // "movieDetails":(context) => const MovieDetails(),
    // "onBoarding":(context) => const OnBoarding(),
    // "login":(context) => const Login(),
    // "register":(context) => const Register(),
    // "forgetPassword":(context) => const ForgetPassword(),
    // "home":(context) => const Home(),
    // "updateProfile":(context) => const UpdateProfile(),
    "/":(context) => const PlaceHolderScreen() 
  } ;
  
}
