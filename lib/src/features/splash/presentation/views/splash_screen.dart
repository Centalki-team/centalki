import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Image.asset(
        'assets/logo/centalki-banner.png',
        width: double.maxFinite,
        height: double.maxFinite,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
