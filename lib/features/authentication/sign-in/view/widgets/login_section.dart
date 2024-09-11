import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/reusable_widgets/custom_circular_indicator.dart';
import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/widgets/custom_text_field.dart';
import 'package:booking_depi_proj/features/authentication/field_validators/field_validator.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/view/identity_providers.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view-model/sign_in_cubit.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/screens/sign_up_screen.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/widgets/redirection_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginSection extends StatefulWidget {

  final ScrollController? scrollController;


  const LoginSection(
      {super.key,this.scrollController});

  @override
  State<LoginSection> createState() => _LoginSectionState();
}

class _LoginSectionState extends State<LoginSection> {
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  final phoneFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();

    phoneFocusNode.addListener(scrollToEnd);
    passwordFocusNode.addListener(scrollToEnd);
  }

  void scrollToEnd() {

    if (phoneFocusNode.hasFocus || passwordFocusNode.hasFocus) {
      if (widget.scrollController != null) {
        if (widget.scrollController!.hasClients) {
          widget.scrollController?.animateTo(
              widget.scrollController!.position.maxScrollExtent,
              duration: const Duration(milliseconds: 400), curve: Curves.easeOut);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInStates>(
      builder: (context, state) {

        var cubit = SignInCubit.getCubit(context);

        return Column(
          children: [
            const IdentityProviders(),
            CustomTextField(
              focusNode: phoneFocusNode,
              textInputAction: TextInputAction.next,
              controller: phoneController,
              keyboardType: TextInputType.phone,
              validator: FieldValidator.internationalPhoneValidator,
              text: 'Phone',
              suffixIcon: Icons.phone,
            ),
            Spacers(AppStyles.defaultPadding).verticalSpace,

            CustomTextField(
              focusNode: passwordFocusNode,
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
              child: state is SignInLoadingState? CustomCircularIndicator():CustomFilledButton(text: 'Sign in', onPressed: () {
                cubit.signUserIn(phone: phoneController.text, password: passwordController.text);
              }),
            ),

            RedirectionTextButton(text: 'Forget Password', onPressed: () {
              cubit.userForgetPassword();
            }),

            RedirectionTextButton(text: 'Don\'t Have an account, Join us',
                onPressed: () =>
                    Navigator.of(context).pushNamed(SignUpScreen.routeName)),


          ],
        );
      },
    );
  }

  @override
  void dispose() {
    phoneFocusNode.dispose();
    passwordFocusNode.dispose();
    widget.scrollController?.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
