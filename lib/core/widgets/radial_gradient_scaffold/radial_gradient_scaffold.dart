import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:booking_depi_proj/core/widgets/radial_gradient_scaffold/radial_background.dart';
import 'package:flutter/material.dart';

class RadialGradientScaffold extends StatelessWidget {

  final Widget? body;

  const RadialGradientScaffold({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.topCenter,
        children: [
          const RadialBackground(),
          Positioned.fill(child: body ?? const SizedBox.shrink()),
        ],
      ),
    );
  }
}
