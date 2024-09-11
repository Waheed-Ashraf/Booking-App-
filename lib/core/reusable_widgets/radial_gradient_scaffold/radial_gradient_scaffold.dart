import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_background.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RadialGradientScaffold extends StatelessWidget {
  final Widget body;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  RadialGradientScaffold({super.key, required this.body, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: radialColor.withOpacity(.5),
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: radialColor.withOpacity(.5),
      systemNavigationBarDividerColor: Colors.transparent,
    ));
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        //resizeToAvoidBottomInset: true, // Ensures the scaffold resizes when keyboard appears
        body: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: context.height,
          ),
          child: IntrinsicHeight(
            // Ensures the Stack takes up minimum height of the screen
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
