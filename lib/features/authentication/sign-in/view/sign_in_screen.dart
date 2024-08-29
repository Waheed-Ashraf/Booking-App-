import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {

  static const routeName = '/SignIn';
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('SignIn'),),
      body: Center(child: Text('SignIn Screen')),
    );
  }
}
