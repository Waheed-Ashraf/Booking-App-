import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.text,
      this.color = primaryColor,
      this.withBorder = false,
      required this.onPressed,
      required this.widget});
  final Widget widget;
  final String text;
  final Color? color;
  final bool withBorder;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      minWidth: double.infinity,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: withBorder
              ? const BorderSide(color: textFieldBorderGrayColor, width: 1)
              : BorderSide.none),
      onPressed: onPressed,
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget,
          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: color == primaryColor ? Colors.white : Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
