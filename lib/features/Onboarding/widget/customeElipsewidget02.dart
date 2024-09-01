import 'package:flutter/material.dart';

class elipsewidget02 extends StatelessWidget {
  const elipsewidget02({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
          top: -20, // Y position
          left: 175, // X position
          child: Container(
            width: 342, // Width of the ellipse
            height: 342, // Height of the ellipse
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Make it circular
              gradient: LinearGradient(
                colors: [ Color(0xFF07D9AD),Color(0xFF0EBE7E)], // Adjust gradient colors as needed
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
        );
  }
}
