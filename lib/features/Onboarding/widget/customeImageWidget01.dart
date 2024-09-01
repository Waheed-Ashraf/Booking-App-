import 'package:flutter/material.dart';

class imageWidget extends StatelessWidget {
  const imageWidget({
    super.key,
     required this.image,
    
  });
final String image;
  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: 91, // Y position
          left: 12, // X position
          child: Container(
            width: 336, // Width of the ellipse
            height: 336, // Height of the ellipse
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Make it circular
              image: DecorationImage(
                image: AssetImage("assets/images/$image"), // Replace with your image asset path
                fit: BoxFit.cover, // Ensures the image covers the circle
              ),
            ),
          ),
        );
  }
}

