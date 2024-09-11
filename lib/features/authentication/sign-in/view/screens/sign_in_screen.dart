import 'dart:developer';

import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/custom_circular_indicator.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/core/widgets/custom_snack_bar.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view-model/sign_in_cubit.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/widgets/code_bottom_sheet/forget_password_code_bottom_sheet.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/widgets/forget_password_bottom_sheet/forget_password_bottom_sheet.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/widgets/login_section.dart';
import 'package:booking_depi_proj/features/home/presentation/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {

  static const routeName = '/SignIn';
  final ScrollController scrollController = ScrollController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: BlocConsumer<SignInCubit, SignInStates>(
        listener: (context, state) {
          var cubit = SignInCubit.getCubit(context);

          if(state is SignInSuccessState){
            Navigator.of(context).pushNamed(HomeScreen.routeName);
          }

          if(state is SignInFailureState){
            // TODO: This part will be updated to only show failure if there's not mounted bottom sheets
            //Just wait
              showSnackBar(
                  context, color: redColor, message: state.failure.errMessage);

          }
          if(state is WannaEnterPhoneInForgottenPassword){

            scaffoldKey.currentState!.showBottomSheet(
              (context)=>ForgetPasswordBottomSheet(scaffoldKey : scaffoldKey),
              showDragHandle: true,
              backgroundColor: radialColor.withOpacity(1),
              enableDrag: true,
              sheetAnimationStyle: AnimationStyle(
                  duration: Duration(seconds: 1),
                  curve: Curves.easeOut,
                  reverseCurve: Curves.easeOut,
                  reverseDuration: const Duration(seconds: 1)),
            );
          }

        },
        builder: (context, state) {

          var cubit = SignInCubit.getCubit(context);

          return RadialGradientScaffold(
              scaffoldKey: scaffoldKey,
              body: Padding(
                padding:  EdgeInsets.symmetric(
                    horizontal: AppStyles.defaultPadding, vertical: MediaQuery
                    .of(context)
                    .padding
                    .top),

                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Column(
                    children: [


                      127.verticalSpace,
                      Text(
                        'Welcome Back',
                        style: AppStyles.styleMedium24,
                      ),
                      10.verticalSpace,

                      Text(
                        'You can book an appointment, chat with doctors or even make a video call!',
                        textAlign: TextAlign.center,
                        style: AppStyles.styleLight14.copyWith(
                          color: Color(0xff677294),
                        ),
                      ),

                      LoginSection(
                        scrollController: scrollController,
                      ),
                    ],
                  ),
                ),
              )
          );
        },
      ),
    );
  }
}
