import 'package:centalki/base/define/dimensions.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const Text(
                'Home Page',
                style: TextStyle(
                  fontSize: 48,
                ),
              ),
              const SizedBox(
                height: bigSpacing20,
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.logout_rounded, size: 48,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
