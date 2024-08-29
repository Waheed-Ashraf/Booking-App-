import 'package:booking_depi_proj/modules/home/presentation/views/Onboarding%20screen-02.dart';
import 'package:flutter/material.dart';
import 'package:booking_depi_proj/core/widgets/custom_button.dart';

class Onboarding_Screen01 extends StatelessWidget {
  const Onboarding_Screen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
               Positioned.fill(
            child: Image.asset(
              'images/bg.png', 
              fit: BoxFit.cover, 
            ),
          ),
          // Background gradient circle
          Positioned(
            top: -20, // Y position
            left: -104, // X position
            child: Container(
              width: 342, // Width of the ellipse
              height: 342, // Height of the ellipse
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Make it circular
                gradient: LinearGradient(
                  colors: [Color(0xFF0EBE7E), Color(0xFF07D9AD)], // Adjust gradient colors as needed
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25), // Shadow color
                    spreadRadius: 0, // Spread radius
                    blurRadius: 4, // Blur radius
                    offset: Offset(0, 4), // Shadow position
                  ),
                ],
              ),
            ),
          ),
          // Image ellipse
          Positioned(
            top: 91, // Y position
            left: 35, // X position
            child: Container(
              width: 336, // Width of the ellipse
              height: 336, // Height of the ellipse
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Make it circular
                image: DecorationImage(
                  image: AssetImage("images/Ellipse 154.png"), // Replace with your image asset path
                  fit: BoxFit.cover, // Ensures the image covers the circle
                ),
              ),
            ),
          ),
          // Center content with text and button
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0), // Adjust bottom padding as needed
              child: Column(
                mainAxisSize: MainAxisSize.min, // Minimize the height of the column to its content
                children: [
                  // Text
                  Text(
                    "Find Trusted Doctors",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color(0xff333333),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10), // Space between title and description
                  // Description text
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0), // Padding for better readability
                    child: Text(
                      "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of literature over 2000 years old.",
                      textAlign: TextAlign.center, // Center align text
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xff677294),
                      ),
                    ),
                  ),
                  SizedBox(height: 5), // Space between description and button
                  // Button
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: CustomButton(
              
              color: Color(0xff0EBE7F),
                text: '',
                widget: Text("Get Started",style: TextStyle(fontSize: 18,color: Colors.white),),
                onPressed: () {
                  // Handle button press
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Onboarding_Screen02(),));

                },
              ),
          ),
                 
                TextButton(onPressed: () {  },
                child: Text("skip",style: TextStyle(fontSize: 14,color: Color(0xff677294)),))


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
