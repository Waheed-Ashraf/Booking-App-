import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class SheetDraggingContainer extends StatelessWidget {
  const SheetDraggingContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: context.width / 4, vertical: AppStyles.defaultPadding),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(AppStyles.defaultBorderRadius),
      ),
    );
  }
}
