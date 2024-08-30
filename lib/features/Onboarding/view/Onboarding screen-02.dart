import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/elipsewidget02.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/imageWidget01.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/text_and_descrition_Widget.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/sign_in_screen.dart';
import 'package:booking_depi_proj/features/Onboarding/view/Onboarding%20screen-03.dart';
import 'package:flutter/material.dart';
import 'package:booking_depi_proj/core/widgets/custom_button.dart';

class Onboarding_Screen02 extends StatelessWidget {
  const Onboarding_Screen02({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Stack(
        children: [
          const elipsewidget02(),
          // Image ellipse
          const imageWidget(image: "Ellipse 154",),
          // Center content with text and button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 70.0), // Adjust bottom padding as needed
              child: Column(
                mainAxisSize: MainAxisSize
                    .min, // Minimize the height of the column to its content
                children: [
                  // Text

                  const text_and_descrition_Widget(
                      text: "Choose Best Doctors", description: "helps you select top-rated and highly skilled medical professionals to meet your healthcare needs, focusing on providing high-quality care based on experience and trust."),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,top: 30),
                    child: CustomFilledButton(
                      text: 'Get Started',
                      onPressed: () {
                        // Handle button press
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Onboarding_Screen03(),
                            ));
                      },
                    ),
                  ),

                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
                            ));
                      },
                      child: const Text(
                        "skip",
                        style:
                            TextStyle(fontSize: 14, color: Color(0xff677294)),
                      ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
