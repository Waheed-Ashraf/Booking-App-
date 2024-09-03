import 'dart:async';

import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/custom_circular_indicator.dart';
import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/core/widgets/custom_snack_bar.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/screens/sign_in_screen.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view-model/sign_up_cubit.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/code_bottom_sheet/code_bottom_sheet.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/redirection_text_button.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/sing_up_section.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/terms_services_radio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {

  static const routeName = '/SignUp';

  SignUpScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {

          if(state is SignUpUserDidNotAgreedOnTerms){
            showSnackBar(context ,color: redColor, message: "Confirm Your Agreement with Terms");
          }
          if(state is SignUpVerificationFailureState){
            showSnackBar(context ,color: redColor, message: state.failure.errMessage);
          }
          if(state is SignUpShowCodeBottomSheetState){
            scaffoldKey.currentState?.showBottomSheet(
              (context)=>CodeBottomSheet(),
              backgroundColor: radialColor.withOpacity(1),
              enableDrag: true,
              showDragHandle: true,
            );
          }
          if(state is SignUpSuccessState){
            showSnackBar(context, color: greenColor, message: 'Signed Up !');
            Timer(Duration(seconds: 2), ()=>Navigator.of(context).pushNamed(SignInScreen.routeName));
          }
        },
        builder: (context, state) {
          var cubit = SignUpCubit.getCubit(context);

          return Stack(
            fit: StackFit.expand,
            children: [
              RadialGradientScaffold(
                scaffoldKey: scaffoldKey,
                body: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: AppStyles.defaultPadding, vertical: MediaQuery
                      .of(context)
                      .padding
                      .top),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height * 0.127,),

                        Text(
                          'Join and appointment',
                          textAlign: TextAlign.center,
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

                        SignUpSection(formKey: formKey,
                          nameController: cubit.nameController,
                          phoneController: cubit.phoneController,
                          passwordController: cubit.passwordController,
                          scrollController: scrollController,),

                        17.verticalSpace,

                        TermsAndServicesRadioButton(
                          agree: cubit.agreeOnTerms,
                          onChanged: cubit.changeAgreeOnTerms,
                        ),

                        8.verticalSpace,
                        CustomFilledButton(text: 'Verify Data', onPressed: () {

                          if(cubit.agreeOnTerms){
                            if(formKey.currentState?.validate() ?? false){
                              cubit.wannaVerifyData();
                            }

                          }
                          else{

                            // cubit should emit agree must be selected
                            cubit.userDidNotAgreed();
                          }

                        }),
                        RedirectionTextButton(
                          text: 'Have an Account?  Sign in', onPressed: (){
                            cubit.cancelStreamSubscription();
                            Navigator.of(context).pushNamed(SignInScreen.routeName);
                        },),
                      ],
                    ),
                  ),
                ),
              ),
              if(state is SignUpLoadingState)
                const Center(child: CustomCircularIndicator()),
            ],
          );
        },
      ),
    );
  }
}
