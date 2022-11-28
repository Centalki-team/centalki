import 'package:centalki/base/define/colors.dart';
import 'package:centalki/src/features/authentication/verify_email.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import '../home/home_view.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool _emptyName = false;
  bool _emptyEmail = false;
  bool _emptyPassword = false;
  bool _emptyRetypePassword = false;

  bool _passwordMismatch = false;
  bool _invalidEmail = false;

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();

  bool _termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            Image.asset(
              'assets/illustration/register.png',
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 32),
            Text(
              'Create new account',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 24),
            Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.grey[200],
              child: TextField(
                controller: _nameController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400],
                  ),
                  hintText: 'Full name',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: Icon(Icons.person_rounded,
                        color: colorScheme.primary, size: 32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: _emptyName
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorScheme.error, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        )
                      : const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colorScheme.primary, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
            _emptyName
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      'Name cannot be empty',
                      style: TextStyle(fontSize: 14, color: colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16),
            Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.grey[200],
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400],
                  ),
                  hintText: 'Email',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: Icon(Icons.mail_rounded,
                        color: colorScheme.primary, size: 32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: _emptyEmail || _invalidEmail
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorScheme.error, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        )
                      : const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: colorScheme.primary, width: 2),
                      borderRadius: BorderRadius.circular(16)),
                ),
              ),
            ),
            _emptyEmail
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      'E-mail address cannot be empty',
                      style: TextStyle(fontSize: 14, color: colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink(),
            _invalidEmail
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      'Please enter a valid email address',
                      style: TextStyle(fontSize: 14, color: colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16),
            Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.grey[200],
              child: TextField(
                controller: _passwordController,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400],
                  ),
                  hintText: 'Password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: Icon(Icons.key_rounded,
                        color: colorScheme.primary, size: 32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: _emptyPassword
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorScheme.error, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        )
                      : const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.primary, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            _emptyPassword
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      'Password cannot be empty',
                      style: TextStyle(fontSize: 14, color: colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16),
            Material(
              borderRadius: BorderRadius.circular(16),
              elevation: 3.0,
              clipBehavior: Clip.hardEdge,
              shadowColor: Colors.grey[200],
              child: TextField(
                controller: _retypePasswordController,
                autocorrect: false,
                obscureText: true,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400],
                  ),
                  hintText: 'Re-type password',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 12),
                    child: Icon(Icons.key_rounded,
                        color: colorScheme.primary, size: 32),
                  ),
                  contentPadding: const EdgeInsets.symmetric(vertical: 20),
                  enabledBorder: _emptyRetypePassword || _passwordMismatch
                      ? OutlineInputBorder(
                          borderSide:
                              BorderSide(color: colorScheme.error, width: 2),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16)),
                        )
                      : const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                        ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: colorScheme.primary, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            _emptyRetypePassword
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      'Please enter your password again',
                      style: TextStyle(fontSize: 14, color: colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink(),
            _passwordMismatch
                ? Padding(
                    padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                    child: Text(
                      'Your password does not match',
                      style: TextStyle(fontSize: 14, color: colorScheme.error),
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  activeColor: colorScheme.primary,
                  value: _termsAccepted,
                  onChanged: (value) {
                    setState(() {
                      _termsAccepted = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'I have read and accept Terms and Conditions',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: _termsAccepted
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: _termsAccepted
                            ? colorScheme.primary
                            : colorScheme.onPrimaryContainer),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () async {
                // Validate full name
                if (_nameController.text.isEmpty) {
                  setState(() {
                    _emptyName = true;
                  });
                } else {
                  setState(() {
                    _emptyName = false;
                  });
                }
                // Validate email address
                if (_emailController.text.isEmpty) {
                  setState(() {
                    _emptyEmail = true;
                  });
                } else {
                  setState(() {
                    _emptyEmail = false;
                  });
                  if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(_emailController.text)) {
                    setState(() {
                      _invalidEmail = true;
                    });
                  } else {
                    setState(() {
                      _invalidEmail = false;
                    });
                  }
                }
                // Validate password
                if (_passwordController.text.isEmpty) {
                  setState(() {
                    _emptyPassword = true;
                  });
                } else {
                  setState(() {
                    _emptyPassword = false;
                  });
                }
                // Validate re-typed password
                if (_retypePasswordController.text.isEmpty) {
                  setState(() {
                    _emptyRetypePassword = true;
                  });
                } else {
                  setState(() {
                    _emptyRetypePassword = false;
                  });
                  if (_passwordController.text !=
                      _retypePasswordController.text) {
                    setState(() {
                      _passwordMismatch = true;
                    });
                  } else {
                    setState(() {
                      _passwordMismatch = false;
                    });
                  }
                }
                if (!_emptyName &&
                    !_emptyEmail &&
                    !_emptyPassword &&
                    !_emptyRetypePassword &&
                    !_passwordMismatch) {
                  try {
                    final credential = await FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                      email: _emailController.text.trim(),
                      password: _passwordController.text.trim(),
                    );
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("The password provided is too weak."),
                      ));
                      //print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content:
                            Text("The account already exists for that email."),
                      ));
                      //print('The account already exists for that email.');
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(e.toString()),
                    ));
                  }
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => const HomeView(),
                  //     ));
                }
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const VerifyEmailView(),
                //     ));
              },
              style: TextButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  minimumSize: const Size.fromHeight(64),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              child: const Text(
                'Register',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Have an account?',
                  style: TextStyle(
                      fontSize: 17, color: colorScheme.onPrimaryContainer),
                ),
                const SizedBox(width: 4),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 17,
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
}
