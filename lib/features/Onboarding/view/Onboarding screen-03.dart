import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/customeElipsewidget01.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/customeImageWidget01.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/text_and_descrition_Widget.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/sign_in_screen.dart';
import 'package:booking_depi_proj/features/Onboarding/view/Onboarding%20screen-02.dart';
import 'package:flutter/material.dart';
import 'package:booking_depi_proj/core/widgets/custom_button.dart';

class Onboarding_Screen03 extends StatelessWidget {
  const Onboarding_Screen03({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Stack(
        children: [
          const elipsewidget(),
          // Image ellipse
          const imageWidget(
            image: "clinic.jpg",
          ),
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
                  const text_and_descrition_Widget(
                      text: "Easy Appointments",
                      description:
                          "Scheduling an appointment with Dr. Ahmed Hassan is quick and easy. Use our app to book your visit at a time that suits you best."),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: CustomFilledButton(
                      text: 'Get Started',
                      onPressed: () {
                        // Handle button press
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInScreen(),
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
