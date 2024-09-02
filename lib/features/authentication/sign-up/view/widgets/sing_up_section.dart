import 'package:booking_depi_proj/core/extensions/spacers.dart';
import 'package:booking_depi_proj/core/widgets/custom_text_field.dart';
import 'package:booking_depi_proj/features/authentication/field_validators/field_validator.dart';
import 'package:booking_depi_proj/features/authentication/identity_providers/view/identity_providers.dart';
import 'package:flutter/material.dart';

class SignUpSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  final ScrollController? scrollController;

  const SignUpSection(
      {super.key,
      this.scrollController,
      required this.formKey,
      required this.nameController,
      required this.passwordController,
      required this.phoneController});

  @override
  State<SignUpSection> createState() => _SignUpSectionState();
}

class _SignUpSectionState extends State<SignUpSection> {
  final FocusNode nameNode = FocusNode();
  final FocusNode phoneNode = FocusNode();
  final FocusNode passwordNode = FocusNode();

  @override
  void initState() {
    super.initState();
    nameNode.addListener(scrollToEnd);
    phoneNode.addListener(scrollToEnd);
    passwordNode.addListener(scrollToEnd);
  }

  @override
  void dispose() {
    nameNode.dispose();
    phoneNode.dispose();
    passwordNode.dispose();
    super.dispose();
  }

  void scrollToEnd() {
    if (nameNode.hasFocus || phoneNode.hasFocus || passwordNode.hasFocus) {
      if (widget.scrollController != null) {
        if (widget.scrollController!.hasClients) {
          widget.scrollController?.animateTo(
              widget.scrollController!.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeOut);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          const IdentityProviders(),
          CustomTextField(
            focusNode: nameNode,
            controller: widget.nameController,
            keyboardType: TextInputType.name,
            text: 'Name',
            textInputAction: TextInputAction.next,
            validator: FieldValidator.nameValidator,
          ),
          20.verticalSpace,
          CustomTextField(
            focusNode: phoneNode,
            controller: widget.phoneController,
            keyboardType: TextInputType.phone,
            text: 'Phone',
            suffixIcon: Icons.phone,
            textInputAction: TextInputAction.next,
            validator: FieldValidator.internationalPhoneValidator,
          ),
          20.verticalSpace,
          CustomTextField(
            focusNode: passwordNode,
            controller: widget.passwordController,
            keyboardType: TextInputType.visiblePassword,
            isPassword: true,
            text: 'Password',
            textInputAction: TextInputAction.done,
            validator: FieldValidator.passwordValidator,
          ),
        ],
      ),
    );
  }
}
