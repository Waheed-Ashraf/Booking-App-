import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class CustomCircularIndicator extends StatelessWidget {
  const CustomCircularIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      color: radialColor.withOpacity(1),
      backgroundColor: Colors.red,
      strokeCap: StrokeCap.round,
      strokeWidth: 2.5,
    );
  }
}
