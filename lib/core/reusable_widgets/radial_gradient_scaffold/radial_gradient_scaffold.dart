import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_background.dart';
import 'package:flutter/material.dart';

class RadialGradientScaffold extends StatelessWidget {
  final Widget body;

  RadialGradientScaffold({super.key, required this.body});
@override
@override
Widget build(BuildContext context) {
  return Scaffold(
    resizeToAvoidBottomInset: true, // Ensures the scaffold resizes when keyboard appears
    body: SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: context.height,
        ),
        child: IntrinsicHeight( // Ensures the Stack takes up minimum height of the screen
          child: Stack(
            fit: StackFit.expand,
            alignment: Alignment.topCenter,
            children: [
              const RadialBackground(),
              body,
            ],
          ),
        ),
      ),
    ),
  );
}
}
