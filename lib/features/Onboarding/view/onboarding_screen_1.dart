import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/features/Onboarding/view/onboarding_screen_2.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/custom_ellipse_widget.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/custome_Image_widget1.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/text_and_descrition_Widget.dart';
import 'package:booking_depi_proj/features/authentication/sign-up/view/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen1 extends StatelessWidget {

  static const routeName = '/onBoarding1';
  const OnboardingScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Stack(
        children: [
          const EllipseWidget(),
          // Image ellipse
          const ImageWidget(image: "dentist.jpg",),
          // Center content with text and button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(
                  bottom: 60.0), // Adjust bottom padding as needed
              child: Column(
                
                mainAxisSize: MainAxisSize
                    .min, // Minimize the height of the column to its content
                children: [
                  // Text
                  const TextAndDescriptionWidget(

                      text: "Find Trusted Doctors",
                      description:
                          "Meet Dr. Ahmed Hassan, a highly qualified and experienced dentist. Trust him to provide you with exceptional care and a personalized dental experience"), // Space between description and button
                  // Button
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20,top:30),
                    child: CustomFilledButton(
                      text: 'Get Started',
                      onPressed: () {
                        // Handle button press
                        Navigator.of(context).pushNamed(OnboardingScreen2.routeName);
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
