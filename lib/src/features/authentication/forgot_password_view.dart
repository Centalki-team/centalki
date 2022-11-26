import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordContent extends StatefulWidget {
  const ForgotPasswordContent({super.key});

  @override
  State<ForgotPasswordContent> createState() => _ForgotPasswordContentState();
}

class _ForgotPasswordContentState extends State<ForgotPasswordContent> {
  final _emailController = TextEditingController();
  final _errors = {
    'Empty': 'E-mail address cannot be empty',
    'Wrong format': 'E-mail address is not right format'
  };
  var _emailError = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: screenAutoPadding16),
          child: Form(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Image.asset(
                    'assets/illustration/reset_password.png',
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: spaceBetweenLine12,
                ),
                Text(
                  'Your email used to sign in Centalki',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onPrimaryContainer,
                  ),
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
                            BorderSide(color: colorScheme.primary, width: 1),
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
                          _emailError == '' ? null : _errors[_emailError],
                    ),
                  ),
                ),
                const SizedBox(
                  height: spaceBetweenLine20,
                ),
                TextButton(
                  onPressed: () async {
                    String email = _emailController.text;
                    final _emailRegExp = RegExp(
                      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                    );
                    if (email.isEmpty || email == '') {
                      setState(() {
                        _emailError = 'Empty';
                      });
                    } else {
                      setState(() {
                        _emailRegExp.hasMatch(email)
                            ? _emailError = ''
                            : _emailError = 'Wrong format';
                      });
                    }

                    if (!(email.isEmpty || email == '')) {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: email);
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Reser password link was sent to email address: $email!\nPlease do not share to anybody!")));
                      }
                    }
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: colorScheme.primary,
                    minimumSize: const Size.fromHeight(56),
                  ),
                  child: Text(
                    'Reset Password',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                      color: colorScheme.onPrimary,
                    ),
                  ),
                ),
                const SizedBox(
                  height: spaceBetweenLine12,
                ),
                OutlinedButton(
                  onPressed: Navigator.of(context).pop,
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                      colorScheme.surface,
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      colorScheme.primary,
                    ),
                    side: MaterialStateProperty.all(
                        BorderSide(color: colorScheme.outline)),
                    minimumSize: MaterialStateProperty.all(
                      const Size.fromHeight(56),
                    ),
                  ),
                  child: const Text('Return Sign In'),
                ),
                const SizedBox(
                  height: bigSpacing20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
