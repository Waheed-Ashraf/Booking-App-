import 'dart:async';

import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/custom_circular_indicator.dart';
import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/core/widgets/custom_snack_bar.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view-model/sign_in_cubit.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/widgets/change_password_bottom_sheet/change_password_bottom_sheet.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/code_bottom_sheet/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgetPasswordCodeBottomSheet extends StatelessWidget {
  final List<TextEditingController> codeControllers =
      List.generate(6, (i) => TextEditingController());
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey;

  ForgetPasswordCodeBottomSheet({super.key, required this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInStates>(
      listener: (context, state) {
        if (state is SignInFailureState) {
          showSnackBar(context,
              color: redColor, message: state.failure.errMessage);
        }
        if (state is ForgetPasswordShowChangePasswordState) {
          Navigator.of(context).pop();

          Timer(
              const Duration(seconds: 1),
              () => scaffoldKey.currentState!.showBottomSheet(
                    (context) => ChangePasswordBottomSheet(),
                    enableDrag: true,
                    showDragHandle: true,
                    backgroundColor: radialColor.withOpacity(1),
                    sheetAnimationStyle: AnimationStyle(
                        duration: Duration(seconds: 1),
                        curve: Curves.easeOut,
                        reverseCurve: Curves.easeOut,
                        reverseDuration: const Duration(seconds: 1)),
                  ));
        }
        // TODO: implement listener
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
            child: Column(
              children: [
                Text(
                  'Enter 6 Digits Code',
                  style: AppStyles.styleMedium24,
                ),
                15.verticalSpace,
                Text(
                  'Enter the 6 digits code you just received on SMS',
                  style: AppStyles.styleRegular14.copyWith(
                    color: grayTextColor,
                  ),
                ),
                Expanded(
                    child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            ...List.generate(
                                codeControllers.length,
                                (index) => Expanded(
                                        child: CodeTextField(
                                      controller: codeControllers[index],
                                      textInputAction:
                                          (index == codeControllers.length - 1)
                                              ? TextInputAction.done
                                              : TextInputAction.next,
                                    ))),
                          ],
                        ),
                      ),
                      Expanded(
                        child: state is SignInLoadingState? CustomCircularIndicator():Row(
                          children: [
                            Expanded(
                              child: CustomFilledButton(
                                  text: 'Resend Code', onPressed: () {}),
                            ),
                            AppStyles.defaultPadding.horizontalSpace,
                            Expanded(
                              child: CustomFilledButton(
                                  text: 'Verify',
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      cubit.verifySmsCode(
                                          codeControllers: codeControllers);
                                    }
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ));
      },
    );
  }
}
