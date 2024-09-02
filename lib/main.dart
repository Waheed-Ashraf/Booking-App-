
import 'package:bloc/bloc.dart';
import 'package:booking_depi_proj/features/SplashScreen/splash_screen.dart';
import 'package:booking_depi_proj/core/router/router.dart';
import 'package:booking_depi_proj/core/utils/bloc_observer.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/sign_in_screen.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/screens/sign_up_screen.dart';
import 'package:booking_depi_proj/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main()async{

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();

  runApp(Booking());
}

class Booking extends StatelessWidget {
  const Booking({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      splitScreenMode: false,
      minTextAdapt: false,
      child:  MaterialApp(
        title: 'Ehgezly',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterManager.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        theme: ThemeData(
          fontFamily: 'Rubik',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Colors.white,
        ),
      )
    );
  }
}
