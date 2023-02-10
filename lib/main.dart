import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'src/features/authentication/verify_email.dart';
import 'src/features/authentication/views/sign_in_page.dart';
import 'src/features/home/presentation/views/home_page.dart';

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
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
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
        return const HomePage();
      default:
        return const Center(
          child: Text("Splash screen here!"),
        );
    }
  }
}
