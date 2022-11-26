import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:flutter/material.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _errors = {'Email empty': 'E-mail address cannot be empty', 'Wrong email format': 'E-mail address is not right format', 'Password empty': 'Password cannot be empty'};
  var _emailError = '';
  var _passwordError = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: screenAutoPadding16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      child: Icon(Icons.email_rounded, size: 24,),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(radiusTextField)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.primary, width: 2),
                      borderRadius: BorderRadius.circular(radiusTextField),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.error, width: 1),
                      borderRadius: BorderRadius.circular(radiusTextField),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.error, width: 1),
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
                      child: Icon(Icons.key_rounded, size: 24,),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent, width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(radiusTextField)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.primary, width: 2),
                      borderRadius: BorderRadius.circular(radiusTextField),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.error, width: 1),
                      borderRadius: BorderRadius.circular(radiusTextField),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: colorScheme.error, width: 1),
                      borderRadius: BorderRadius.circular(radiusTextField),
                    ),
                    errorText: _passwordError == '' ? null : _errors[_passwordError],
                  ),
                ),
              ),
              const SizedBox(
                height: smallSpacing8,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(colorScheme.primary),
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
                onPressed: () {
                  String email = _emailController.text;
                  String password = _passwordController.text;
                  final _emailRegExp = RegExp(
                    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
                  );
                  setState(() {
                    _emailError = '';
                    _passwordError = '';
                    if (email.isEmpty || email == '') {
                      _emailError = 'Email empty';
                    }
                    else {
                      _emailRegExp.hasMatch(email)
                          ? _emailError = ''
                          : _emailError = 'Wrong email format';
                    }

                    if (password.isEmpty || password == '') {
                      _passwordError = 'Password empty';
                    }
                  });
                },
                style: TextButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  minimumSize: const Size.fromHeight(56),
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
              Text(
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
              // Advanced Features
              /* Row(
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
              ), */
              const SizedBox(
                height: spaceBetweenLine20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
