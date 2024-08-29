import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/redirection_text_button.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/sing_up_section.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/terms_services_radio.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {

  static const routeName = '/SignUp';
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: AppStyles.defaultPadding, vertical: MediaQuery.of(context).padding.top),
          child: SingleChildScrollView(
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

                SignUpSection(),
                17.verticalSpace,
                TermsAndServicesRadioButton(),
                8.verticalSpace,
                CustomFilledButton(text: 'Sign up', onPressed: (){}),
                RedirectionTextButton(text: 'Have an Account?  Sign in', onPressed: (){},),
              ],
            ),
          ),
        ),
      );
  }
}
