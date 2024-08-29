import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    this.onChanged,
    this.isPassword = false,
    this.validator,
    this.text,
    this.controller,
    this.prefixIcon,
    this.keyboardType,
    this.maxLines,
    this.textFieldBorderColor,
    this.suffixIcon,
    this.maxLength,
    this.onFieldSubmitted,
    this.textInputAction = TextInputAction.next,
  });
  final Function(String)? onFieldSubmitted;
  final int? maxLines;
  final TextInputAction textInputAction;
  final Color? textFieldBorderColor;
  final String? prefixIcon;
  final IconData? suffixIcon;
  final int? maxLength;
  final bool? isPassword;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final String? text;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isObscured = false;

  void _toggleVisibility() {
    setState(() {
      _isObscured = !_isObscured;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction: widget.textInputAction,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: grayTextColor),
        maxLength: widget.maxLength,
        maxLines: widget.maxLines ?? 1,
        keyboardType: widget.keyboardType ?? TextInputType.text,
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        obscureText: _isObscured ? true : false,
        onFieldSubmitted: widget.onFieldSubmitted,
        decoration: InputDecoration(
          counterText: "",
          filled: true,
          fillColor: Colors.white,
          hintText: widget.text,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: grayTextColor),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 18.0, vertical: 14),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: widget.textFieldBorderColor ?? textFieldBorderGrayColor,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: primaryColor, width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: redColor.withOpacity(.7), width: 1.5),
            borderRadius: BorderRadius.circular(2),
          ),
          focusedErrorBorder:OutlineInputBorder(
            borderSide: BorderSide(color: redColor.withOpacity(.7), width: 1.5),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: primaryColor,
              width: 1.5,
            ),
          ),
          prefixIcon: widget.prefixIcon == null
              ? null
              : SizedBox(
                  width: 20,
                  height: 20,
                  child: Center(
                    child: SvgPicture.asset(
                      widget.prefixIcon!,
                    ),
                  ),
                ),
          suffixIcon: widget.isPassword == true
              ? GestureDetector(
                  onTap: _toggleVisibility,
                  child: _isObscured
                      ? Icon(
                          color: grayTextColor,
                          Icons.visibility_off,
                          size: 20,
                        )
                      : Icon(
                          Icons.visibility,
                          color: grayTextColor,
                          size: 20,
                        ),
                )
              : widget.suffixIcon != null
                  ? Icon(
                      widget.suffixIcon,
                      color: primaryColor,
                      size: 20,
                    )
                  : null,
        ));
  }
}
