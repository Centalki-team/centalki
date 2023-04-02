import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'base/temp_dio/dio_client.dart';
import 'config/main_config.dart';
import 'di/injection/injection.dart';
import 'firebase_options.dart';
import 'src/features/authentication/presentation/views/sign_in/sign_in_page.dart';
import 'src/features/authentication/presentation/views/verify_email.dart';
import 'src/features/home/presentation/views/home_view.dart';

void main(List<String> args) async {
  await Injection.inject();
  await configureApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
      name: 'YourAPP',
      options: DefaultFirebaseOptions.currentPlatform,
    ).whenComplete(() {
      print("completedAppInitialize");
    });
  }

  HttpOverrides.global = MyHttpOverrides();
  // runApp(
  //   ModularApp(
  //     module: AppModule(),
  //     child: const MyApp(),
  //   ),
  // );
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      fontFamily: 'Dongle',
    ),
    home: const MyWidget(),
  ));
}

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  String _status = 'loading';
  @override
  void initState() {
    // Right after the listener has been registered.
    // When a user is signed in.
    // When the current user is signed out.
    // When there is a change in the current user's token.
    FirebaseAuth.instance.currentUser?.reload();
    FirebaseAuth.instance.idTokenChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          _status = "not_auth";
        });
      } else {
        print('User is signed in!');
        print(user.providerData);
        if (user.providerData[0].providerId.contains('password')) {
          if (!user.emailVerified) {
            user.sendEmailVerification();
            setState(() {
              _status = "not_email_verified";
            });
          } else {
            setState(() {
              _status = "success";
            });
          }
        } else {
          setState(() {
            _status = "success";
          });
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_status);
    switch (_status) {
      case "loading":
        return const Center(
          child: Text("Splash screen here!"),
        );
      case "not_auth":
        return const SignInPage();
      case "not_email_verified":
        return const VerifyEmailView();
      case "success":
        return const HomeView();
      default:
        return const Center(
          child: Text("Splash screen here!"),
        );
    }
  }
}
