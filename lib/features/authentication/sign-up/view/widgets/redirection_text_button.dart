import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class RedirectionTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RedirectionTextButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style:  AppStyles.styleRegular14.copyWith(
          color: greenColor,
        )
      ),
      onPressed: onPressed,
      style: ButtonStyle(
        overlayColor: WidgetStatePropertyAll(radialColor),
        surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
        alignment: Alignment.center,
        padding: WidgetStatePropertyAll(EdgeInsets.all(AppStyles.defaultPadding)),
        foregroundColor: WidgetStatePropertyAll(greenColor),
      ),

    );
  }
}
