import 'package:booking_depi_proj/features/home/presentation/views/widgets/offers_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ehgezly'),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 24,
          ),
          OffersSection(),
        ],
      ),
    );
  }
}
