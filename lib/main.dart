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
  @override
  void initState() {
    FirebaseAuth.instance.idTokenChanges().listen((User? user) {
      print(user);
      if (user == null) {
        print('User is currently signed out!');
        MaterialPageRoute(
          builder: (context) => const SignInView(),
        );
      } else {
        print('User is signed in!');
        if (!user.emailVerified) {
          user.sendEmailVerification();
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const VerifyEmailView(),
              ));
        } else {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeView(),
              ));
        }
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
