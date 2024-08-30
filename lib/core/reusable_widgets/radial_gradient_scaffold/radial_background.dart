import 'package:booking_depi_proj/core/extensions/context_extension.dart';
import 'package:booking_depi_proj/core/utils/constent_colors.dart';
import 'package:flutter/material.dart';

class RadialBackground extends StatelessWidget {
  const RadialBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.5,
                    center: Alignment.topLeft,
                    colors: [
          
                      radialColor,
                      radialColor.withOpacity(.6),
                      radialColor.withOpacity(.3),
                      radialColor.withOpacity(.1),
                      Colors.transparent,
                    ],
                    stops: [
                      .3,
                      .5,
                      .6,
                      .7,
                      1
                    ],
                  )
              ),
            ),
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Container(
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                    radius: 1.3,
                    center: Alignment.bottomRight,
                    colors: [
          
                      radialColor,
                      radialColor.withOpacity(.6),
                      radialColor.withOpacity(.3),
                      radialColor.withOpacity(.1),
                      Colors.transparent,
                    ],
                    stops: [
                      .3,
                      .5,
                      .6,
                      .7,
                      1
                    ],
                  )
              ),
            ),
          ),
        ),
      ],
    );
  }
}
