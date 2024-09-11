import 'dart:async';

import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/custom_circular_indicator.dart';
import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/core/widgets/custom_snack_bar.dart';
import 'package:booking_depi_proj/core/widgets/custom_text_field.dart';
import 'package:booking_depi_proj/features/authentication/field_validators/field_validator.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view-model/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class ChangePasswordBottomSheet extends StatelessWidget {
  final firstPasswordController = TextEditingController();
  final secondPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  ChangePasswordBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInFailureState) {
          showSnackBar(context,
              color: redColor, message: state.failure.errMessage);
        }
        if (state is ForgetPasswordSuccessfullyReset) {
          Navigator.of(context).pop();
          Timer(
              const Duration(seconds: 1),
              () => showSnackBar(context,
                  color: greenColor,
                  message: 'Your password is successfully updated!'));
        }
      },
      builder: (context, state) {
        var cubit = SignInCubit.getCubit(context);

        return Container(
            padding: EdgeInsets.all(AppStyles.defaultPadding),
            height: context.height / 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [radialColor, Colors.white],
                  stops: [.15, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter),
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(AppStyles.defaultPadding)),
            ),
            child: Column(
              children: [
                Text(
                  'Reset Password',
                  style: AppStyles.styleMedium24,
                ),
                15.verticalSpace,
                Text(
                  'Set the new password for your account so you can login and access all the features.',
                  style: AppStyles.styleRegular14.copyWith(
                    color: grayTextColor,
                  ),
                ),
                15.verticalSpace,

                Expanded(
                    child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Expanded(
                          child: Column(
                        children: [
                          CustomTextField(
                            isPassword: true,
                            controller: firstPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: FieldValidator.passwordValidator,
                            textInputAction: TextInputAction.next,
                            text: 'New Password',
                          ),

                          20.verticalSpace,
                          CustomTextField(

                            isPassword: true,
                            controller: secondPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            validator: FieldValidator.passwordValidator,
                            textInputAction: TextInputAction.done,
                            text: 'R-enter Password',
                          ),

                        ]
                      )),
                      state is SignInLoadingState
                          ? Center(child: const CustomCircularIndicator())
                          : CustomFilledButton(
                              text: 'Update Password',
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // TODO: change password and pop every thing
                                  cubit.resetPassword(
                                      firstPassword:
                                          firstPasswordController.text,
                                      secondPassword:
                                          secondPasswordController.text);
                                }
                              })
                    ],
                  ),
                )),
              ],
            ));
      },
    );
  }
}
