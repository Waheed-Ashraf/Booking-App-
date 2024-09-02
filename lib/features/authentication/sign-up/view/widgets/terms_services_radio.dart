import 'dart:developer';

import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';


class TermsAndServicesRadioButton extends StatelessWidget{

  final bool agree ;
  final void Function(bool?) onChanged;

  const TermsAndServicesRadioButton({required this.agree , required this.onChanged});


  @override
  Widget build(BuildContext context) {
    log('agree in the terms itself $agree');
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Checkbox(
            value: agree,
            onChanged: onChanged,
          activeColor: Colors.grey,
          fillColor: WidgetStatePropertyAll(transparent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.defaultPadding),
            side: BorderSide(width: 1, color: Colors.grey.shade300)
          ),
          side: BorderSide(width: 1, color: Colors.grey),
          overlayColor: WidgetStatePropertyAll(radialColor),
          checkColor: greenColor,

        ),

        Text(
            'Agree with Terms of Services & Privacy Policy',
          style: AppStyles.styleRegular12,
          maxLines: 1,
          overflow: TextOverflow.clip,
        ),
      ],
    );
  }
}
