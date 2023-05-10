import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.black,
        body: Image.asset(
          Assets.logo.centalkiBanner.path,
          width: double.maxFinite,
          height: double.maxFinite,
          fit: BoxFit.fitHeight,
        ),
      );
}
