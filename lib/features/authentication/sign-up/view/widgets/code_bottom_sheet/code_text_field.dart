import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CodeTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputAction textInputAction;

  const CodeTextField({super.key, required this.controller, this.textInputAction = TextInputAction.next});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: TextFormField(
        style: AppStyles.styleMedium24.copyWith(
          color: Colors.green,
        ),
        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: Colors.white,
          contentPadding:
          EdgeInsets.symmetric(horizontal: 10.r, vertical: 10.r),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(
              color:  textFieldBorderGrayColor,
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
        ),
        validator: (String? number){
          if(number!= null && number.isNotEmpty){
            if(int.tryParse(number) == null){
              return 'Numbers only';
            }
            return null;
          }
          return ' ';
        },
        controller: controller,
        textInputAction: textInputAction,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        cursorHeight: 30,
        maxLength: 1,
      ),
    );
  }
}
