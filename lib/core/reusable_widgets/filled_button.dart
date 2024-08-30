import 'dart:ui';

import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const CustomFilledButton({super.key, required this.text, required this.onPressed});


  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: Text(
          text,
        style: AppStyles.styleMedium18.copyWith(
          color: Colors.white,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.defaultBorderRadius),
        )),
        backgroundColor: WidgetStatePropertyAll(greenColor),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        minimumSize: WidgetStatePropertyAll(Size(double.infinity, 45)),
        alignment: Alignment.center,
        surfaceTintColor: WidgetStatePropertyAll(greenColor),
        overlayColor: WidgetStatePropertyAll(radialColor),
        animationDuration: Duration(seconds: 1),
        padding: WidgetStatePropertyAll(EdgeInsets.all(AppStyles.defaultPadding),),
      ),

    );
  }
}
