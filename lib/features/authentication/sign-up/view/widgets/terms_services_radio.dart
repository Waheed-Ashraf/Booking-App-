import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class TermsAndServicesRadioButton extends StatefulWidget {

  const TermsAndServicesRadioButton({super.key});

  @override
  State<TermsAndServicesRadioButton> createState() => _TermsAndServicesRadioButtonState();
}

class _TermsAndServicesRadioButtonState extends State<TermsAndServicesRadioButton> {

  bool agree = false;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [

        Checkbox(
            value: agree,
            onChanged: (newValue){
              setState(() {
                agree = newValue??false;
              });
            },
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
