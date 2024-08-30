import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/widgets/custom_text_field.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/identity_proviers_widget/identity_providers.dart';
import 'package:flutter/material.dart';

class SignUpSection extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignUpSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        IdentityProviders(),
        CustomTextField(
          controller: nameController,
          keyboardType: TextInputType.name,
          text: 'Name',
          textInputAction: TextInputAction.next,
        ),
        20.verticalSpace,
        CustomTextField(
          controller: phoneController,
          keyboardType: TextInputType.phone,
          text: 'Phone',
          suffixIcon: Icons.phone,
          textInputAction: TextInputAction.next,
        ),
        20.verticalSpace,
        CustomTextField(
          controller: passwordController,
          keyboardType: TextInputType.visiblePassword,
          isPassword: true,
          text: 'Password',
          textInputAction: TextInputAction.done,
        ),
      ],
    );
  }
}
