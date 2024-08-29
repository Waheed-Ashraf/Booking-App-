import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ehgezly'),),
      body: Center(child: Text('Home Screen')),
    );
  }
}
