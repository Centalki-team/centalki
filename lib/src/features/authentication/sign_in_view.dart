import 'package:centalki/src/features/authentication/forgot_password_view.dart';
import 'package:centalki/src/features/authentication/verify_email.dart';
import 'package:centalki/src/features/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../base/define/colors.dart';
import '../../../base/define/dimensions.dart';
import 'register_view.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _errors = {
    'Email empty': 'E-mail address cannot be empty',
    'Wrong email format': 'E-mail address is not right format',
    'Password empty': 'Password cannot be empty'
  };
  var _emailError = '';
  var _passwordError = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Image.asset(
                'assets/illustration/login.png',
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(
              height: spaceBetweenLine12,
            ),
            Text(
              'Sign in your account',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(
              height: spaceBetweenLine20,
            ),
            Material(
              borderRadius: BorderRadius.circular(radiusTextField),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              shadowColor: colorScheme.shadow,
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                  hintText: 'Email',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 12, right: 16),
                    child: Icon(
                      Icons.email_rounded,
                      size: 24,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 12),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1),
                    borderRadius:
                        BorderRadius.all(Radius.circular(radiusTextField)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.primary, width: 2),
                    borderRadius: BorderRadius.circular(radiusTextField),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.error, width: 1),
                    borderRadius: BorderRadius.circular(radiusTextField),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.error, width: 1),
                    borderRadius: BorderRadius.circular(radiusTextField),
                  ),
                  errorText: _emailError == '' ? null : _errors[_emailError],
                ),
              ),
            ),
            const SizedBox(
              height: spaceBetweenLine12,
            ),
            Material(
              borderRadius: BorderRadius.circular(radiusTextField),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              shadowColor: colorScheme.shadow,
              child: TextField(
                controller: _passwordController,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: const TextStyle(
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                  hintText: 'Password',
                  prefixIcon: const Padding(
                    padding: EdgeInsets.only(left: 12, right: 16),
                    child: Icon(
                      Icons.key_rounded,
                      size: 24,
                    ),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 16, horizontal: 12),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.transparent, width: 1),
                    borderRadius:
                        BorderRadius.all(Radius.circular(radiusTextField)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.primary, width: 2),
                    borderRadius: BorderRadius.circular(radiusTextField),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.error, width: 1),
                    borderRadius: BorderRadius.circular(radiusTextField),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.error, width: 1),
                    borderRadius: BorderRadius.circular(radiusTextField),
                  ),
                  errorText:
                      _passwordError == '' ? null : _errors[_passwordError],
                ),
              ),
            ),
            const SizedBox(
              height: smallSpacing8,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ForgotPasswordView(),
                    )),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all(colorScheme.primary),
                ),
                child: const Text(
                  'Forgot Password?',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(
              height: spaceBetweenLine12,
            ),
            TextButton(
              onPressed: () async {
                String email = _emailController.text;
                String password = _passwordController.text;
                final emailRegExp = RegExp(
                  r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                );
                if (email.isEmpty || email == '') {
                  setState(() {
                    _emailError = 'Email empty';
                  });
                } else {
                  setState(() {
                    emailRegExp.hasMatch(email)
                        ? _emailError = ''
                        : _emailError = 'Wrong email format';
                  });
                }

                if (password.isEmpty || password == '') {
                  setState(() {
                    _passwordError = 'Password empty';
                  });
                }
                else {
                  setState(() {
                    _passwordError = '';
                  });
                }

                if (!(email.isEmpty || email == '') &&
                    emailRegExp.hasMatch(email) &&
                    !(password.isEmpty || password == '')) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (credential.user != null) {
                      if (credential.user!.emailVerified) {
                        if (mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HomeView(),
                              ));
                        }
                      } else {
                        credential.user!.sendEmailVerification();
                        if (mounted) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const VerifyEmailView(),
                              ));
                        }
                      }
                    } else {
                      if (mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Wrong email or password!"),
                        ));
                      }
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found') {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content: Text("No user found for that email!"),
                      ));
                    } else if (e.code == 'wrong-password') {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(const SnackBar(
                        content:
                            Text('Wrong password provided for that user.'),
                      ));
                    }
                  }
                }

                // setState(() {
                //   _emailError = '';
                //   _passwordError = '';
                //   if (email.isEmpty || email == '') {
                //     _emailError = 'Email empty';
                //   } else {
                //     _emailRegExp.hasMatch(email)
                //         ? _emailError = ''
                //         : _emailError = 'Wrong email format';
                //   }

                //   if (password.isEmpty || password == '') {
                //     _passwordError = 'Password empty';
                //   }
                // });
              },
              style: TextButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  minimumSize: const Size.fromHeight(56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
              ),
              child: Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1,
                  color: colorScheme.onPrimary,
                ),
              ),
            ),
            const SizedBox(
              height: bigSpacing20,
            ),
            // Advanced Features
            /*Text(
              'or',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: colorScheme.onBackground,
              ),
            ),
            const SizedBox(
              height: spaceBetweenLine12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: Image.asset('assets/facebook.png',
                      width: 40, height: 40),
                ),
                const SizedBox(width: 40),
                InkWell(
                  onTap: () {},
                  child:
                  Image.asset('assets/google.png', width: 40, height: 40),
                )
              ],
            ),
            const SizedBox(
              height: spaceBetweenLine20,
            ),*/
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Don\'t have an account?',
                  //style: TextStyle(color: colorScheme.primary),
                ),
                TextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterView(),
                      )),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
}
