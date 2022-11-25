import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_module.dart';
import 'firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // runApp(
  //   ModularApp(
  //     module: AppModule(),
  //     child: const MyApp(),
  //   ),
  // );
  runApp(MaterialApp(
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   title: 'Centalki',
    //   routeInformationParser: Modular.routeInformationParser,
    //   routerDelegate: Modular.routerDelegate,
    // );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: onRegister,
                child: const Text('Register'),
              ),
              TextButton(
                onPressed: onLogin,
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: onForgotPassword,
                child: const Text('Forgot password'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onLogin() {}

  void onRegister() {}

  void onForgotPassword() {}
}
