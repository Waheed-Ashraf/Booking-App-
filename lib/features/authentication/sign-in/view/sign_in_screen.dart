import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {

  static const routeName = '/SignIn';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            127.verticalSpace,
            Text(
              'Welcome Back',
              style: AppStyles.styleMedium24,
            ),
            10.verticalSpace,

            Text(
              'This Login is Under Construction, Just Wait!!',
              textAlign: TextAlign.center,
              style: AppStyles.styleLight14.copyWith(
                color: Color(0xff677294),
              ),

            ),
          ],
        ),
      )
    );
  }
}
