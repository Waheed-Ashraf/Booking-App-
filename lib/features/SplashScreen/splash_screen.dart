import 'dart:async';

import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/features/Onboarding/view/onboarding_screen_1.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const routeName = '/Splash';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
   Timer(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushNamedAndRemoveUntil(OnboardingScreen1.routeName, (route) => false,);
      },
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Stack(
        
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo or main image
                Image.asset(
                  'assets/images/Logo.png',
                  height: 300.0, //
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
