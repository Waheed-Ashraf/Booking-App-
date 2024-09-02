import 'package:flutter/material.dart';

class TextAndDescriptionWidget extends StatelessWidget {
  const TextAndDescriptionWidget({
    super.key,
    required this.text,
    required this.description,
  });

  final String text;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
                  children: [
                    Text(
                      text,
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
                       description,
                        textAlign: TextAlign.center, // Center align text
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff677294),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                );
  }
}

