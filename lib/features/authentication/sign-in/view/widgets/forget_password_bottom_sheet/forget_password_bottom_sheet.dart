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
import 'package:booking_depi_proj/features/authentication/sign-in/view/widgets/code_bottom_sheet/forget_password_code_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordBottomSheet extends StatelessWidget {
  final TextEditingController phoneController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey;


  ForgetPasswordBottomSheet({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context,state){
        var cubit = SignInCubit.getCubit(context);

        if(state is SignInFailureState){
          showSnackBar(context, color: redColor, message: state.failure.errMessage);
        }
        if(state is ForgetPasswordPhoneRegisteredState){
          Navigator.of(context).pop();
          cubit.sendSmsToPhone();
          Timer(const Duration(seconds: 1), ()=>scaffoldKey.currentState!.showBottomSheet(
                (context)=>ForgetPasswordCodeBottomSheet(scaffoldKey: scaffoldKey,),
            showDragHandle: true,
            backgroundColor: radialColor.withOpacity(1),
            enableDrag: true,
            sheetAnimationStyle: AnimationStyle(
                duration: Duration(seconds: 1),
                curve: Curves.easeOut,
                reverseCurve: Curves.easeOut,
                reverseDuration: const Duration(seconds: 1)),
          ));
        }
      },
      builder: (context, state) {
        var cubit = SignInCubit.getCubit(context);

        return Container(
          padding: EdgeInsets.all(AppStyles.defaultPadding),
          height: context.height / 2.3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [radialColor, Colors.white],
                stops: [.15, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter),
            borderRadius: BorderRadius.vertical(
                top: Radius.circular(AppStyles.defaultPadding)),
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: context.height / 2.3,
              child: Column(
                children: [
                  Text(
                    'Forget Password',
                    style: AppStyles.styleMedium24,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  20.verticalSpace,
                  Text(
                    'Enter Your phone number which is registered in our system, and you will receive a 6 digits code to enter.',
                    style: AppStyles.styleRegular14.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  20.verticalSpace,
                  Expanded(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          CustomTextField(
                            maxLines: 1,
                            controller: phoneController,
                            suffixIcon: Icons.phone,
                            text: 'Phone',
                            validator:
                                FieldValidator.internationalPhoneValidator,
                            keyboardType: TextInputType.phone,
                            textInputAction: TextInputAction.done,
                          ),
                          Padding(
                            padding: EdgeInsets.all(AppStyles.defaultPadding),
                            child: state is SignInLoadingState
                                ? const CustomCircularIndicator()
                                : CustomFilledButton(
                                    text: 'Verify Phone',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.verifyPhoneInForgetPassword(
                                            phone: phoneController.text);
                                      }
                                    }),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
