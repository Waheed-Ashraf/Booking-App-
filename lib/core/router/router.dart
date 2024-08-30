import 'package:booking_depi_proj/features/authentication/sign-in/view/sign_in_screen.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/screens/sign_up_screen.dart';
import 'package:booking_depi_proj/features/home/home_screen.dart';
import 'package:booking_depi_proj/features/SplashScreen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final class RouterManager{

  static Route<dynamic> onGenerateRoute(RouteSettings settings){

    // Matching pattern switch

    return switch(settings.name){
      SplashScreen.routeName => MaterialPageRoute(builder: (context)=>SplashScreen()),
      SignInScreen.routeName =>MaterialPageRoute(builder: (context)=>SignInScreen()),
      SignUpScreen.routeName =>MaterialPageRoute(builder: (context)=>SignUpScreen()),

      _ => MaterialPageRoute(builder: (context)=>SplashScreen()),
    };


  }
}