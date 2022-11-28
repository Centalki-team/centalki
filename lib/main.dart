import 'package:centalki/src/features/authentication/sign_in_view.dart';
import 'package:centalki/src/features/authentication/verify_email.dart';
import 'package:centalki/src/features/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

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
  runApp(const MaterialApp(
    home: MyWidget(),
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
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      print(user);
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          _status = "not_auth";
        });
      } else {
        print('User is signed in!');
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
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    switch (_status) {
      case "loading":
        return const Center(
          child: Text("Splash screen here!"),
        );
      case "not_auth":
        return const SignInView();
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
