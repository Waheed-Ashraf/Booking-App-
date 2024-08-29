import 'package:booking_depi_proj/modules/home/presentation/views/Onboarding%20screen-01.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Onboarding_Screen01(),));
    },);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'images/bg.png', 
              fit: BoxFit.cover, 
            ),
          ),
          // Foreground content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo or main image
                Image.asset(
                  'images/Logo.png', 
                  height: 150.0, // 
                ),
            
               
              ],
            ),
          ),
        ],
      ),
    );
  }
}
