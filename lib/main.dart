import 'package:firebase_auth/firebase_auth.dart';
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
  runApp(const MaterialApp(
    home: MyApp(),
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
      body: Builder(builder: (context) {
        FirebaseAuth.instance.idTokenChanges().listen((User? user) {
          print(user);
          if (user == null) {
            print('User is currently signed out!');
          } else {
            print('User is signed in!');
            if (!user.emailVerified) {
              user.sendEmailVerification();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NeedVerifiedPage(),
                  ));
            } else {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            }
          }
        });
        return SafeArea(
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
                  onPressed: onVerifyEmail,
                  child: const Text('Verify email'),
                ),
                TextButton(
                  onPressed: onForgotPassword,
                  child: const Text('Forgot password'),
                ),
                TextButton(
                  onPressed: onSignOut,
                  child: const Text('Sign out'),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  void onLogin() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'dgrayman1509@gmail.com',
        password: 'A_bc123',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void onRegister() async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: 'dgrayman1509@gmail.com',
        password: 'A_bc123',
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void onForgotPassword() async {
    await FirebaseAuth.instance
        .sendPasswordResetEmail(email: 'trongduc1509@gmail.com');
  }

  void onSignOut() async {
    await FirebaseAuth.instance.signOut();
  }

  void onVerifyEmail() async {}
}

class NeedVerifiedPage extends StatelessWidget {
  const NeedVerifiedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'Vui lòng xác thực email!',
        style: TextStyle(
          color: Colors.black,
        ),
      )),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBar(
      //   automaticallyImplyLeading: false,
      // ),
      backgroundColor: Colors.white,
      body: Center(
          child: Text(
        'HomePage',
        style: TextStyle(
          color: Colors.black,
        ),
      )),
    );
  }
}
