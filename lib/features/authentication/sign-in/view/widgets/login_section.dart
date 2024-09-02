import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/widgets/custom_text_field.dart';
import 'package:booking_depi_proj/features/authentication/field_validators/field_validator.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/view/identity_providers.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/redirection_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSection extends StatelessWidget {
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  const LoginSection({super.key, required this.phoneController, required this.passwordController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IdentityProviders(),
        CustomTextField(
          textInputAction: TextInputAction.next,
          controller: phoneController,
          keyboardType: TextInputType.phone,
          validator: FieldValidator.internationalPhoneValidator,
          text: 'Phone',
          suffixIcon: Icons.phone,
        ),
        Spacers(AppStyles.defaultPadding).verticalSpace,

        CustomTextField(
          textInputAction: TextInputAction.done,
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          validator: FieldValidator.passwordValidator,
          text: 'Password',
          isPassword: true,
        ),
        Spacers(20).verticalSpace,

        Padding(padding: EdgeInsets.symmetric(
          vertical: 10.h,
          horizontal: AppStyles.defaultPadding,
        ),
          child: CustomFilledButton(text: 'Login', onPressed: (){}),
        ),

        RedirectionTextButton(text: 'Forget Password', onPressed: (){}),

        RedirectionTextButton(text: 'Don\'t Have an account, Join us', onPressed: (){}),



      ],
    );
  }
}
