import 'package:booking_depi_proj/core/reusable_widgets/radial_gradient_scaffold/radial_gradient_scaffold.dart';
import 'package:booking_depi_proj/core/widgets/grediant_button.dart';
import 'package:booking_depi_proj/features/home/presentation/views/widgets/home_navigation_section.dart';
import 'package:booking_depi_proj/features/home/presentation/views/widgets/offers_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RadialGradientScaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const OffersSection(),
          const Spacer(),
          const NavigationSection(),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GradientButton(text: "Appointment", onPressed: () {}),
          )
        ],
      ),
    );
  }
}
