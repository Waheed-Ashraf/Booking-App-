import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/custom_ellipse_widget.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/custome_Image_widget1.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/text_and_descrition_Widget.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen3 extends StatelessWidget {
  static const routeName = 'onBoarding3';
  const OnboardingScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Stack(
        children: [
          const EllipseWidget(),
          // Image ellipse
          const ImageWidget(
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
                  const TextAndDescriptionWidget(
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
                        Navigator.of(context).pushNamed(SignUpScreen.routeName);
                      },
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
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
