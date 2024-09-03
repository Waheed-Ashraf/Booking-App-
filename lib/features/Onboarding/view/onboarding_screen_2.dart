import 'package:booking_depi_proj/core/reusable_widgets/filled_button.dart';
import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/features/Onboarding/view/onboarding_screen_3.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/custom_elipse_widget2.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/custome_Image_widget1.dart';
import 'package:booking_depi_proj/features/Onboarding/widget/text_and_descrition_Widget.dart';
import 'package:booking_depi_proj/features/authentication/sign-in/view/screens/sign_in_screen.dart';
import 'package:flutter/material.dart';

class OnboardingScreen2 extends StatelessWidget {

  static const routeName = '/onBoarding2';

  const OnboardingScreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Stack(
        children: [
          const EllipseWidget2(),
          // Image ellipse
          const ImageWidget(
            image: "instruments.jpg",
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
                  // Text

                  const TextAndDescriptionWidget(
                      text: "Find Best Tools",
                      description:
                          "Our clinic uses state-of-the-art dental tools and technology to ensure the highest standards of care. Experience modern dentistry with Dr. Ahmed Hassan."),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 30),
                    child: CustomFilledButton(
                      text: 'Get Started',
                      onPressed: () {
                        // Handle button press
                        Navigator.of(context).pushNamed(OnboardingScreen3.routeName);
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
