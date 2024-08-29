import 'package:booking_depi_proj/modules/home/presentation/views/splash_screen.dart';
import 'package:booking_depi_proj/core/router/router.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/sign_up_screen.dart';
import 'package:booking_depi_proj/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(Booking());
}

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ehgezly',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterManager.onGenerateRoute,
    //  initialRoute: SplashScreen.routeName,
    home: Scaffold(body: SplashScreen(),),);
  }
}
