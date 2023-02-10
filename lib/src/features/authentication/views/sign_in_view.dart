import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../base/define/app_text.dart';
import '../../../../base/define/colors.dart';
import '../../../../base/define/dimensions.dart';
import '../../../../base/define/manager/loading_manager.dart';
import '../../../../base/temp_dio/dio_client.dart';
import '../../../../base/widgets/buttons/button.dart';
import '../../../../gen/assets.gen.dart';
import '../../home/presentation/views/home_page.dart';
import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../forgot_password_view.dart';
import '../sign_up_view.dart';
import '../verify_email.dart';

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
    'Wrong email format': 'Invalid email format',
    'Password empty': 'Password cannot be empty'
  };
  var _emailError = '';
  var _passwordError = '';

  @override
  Widget build(BuildContext context) => BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoadingState) {
            LoadingManager.setLoading(true, context);
          } else {
            LoadingManager.setLoading(false, context);
            if (state is SignInLoadErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            } else if (state is SignInLoadDoneState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
            } else if (state is SignInVerifyEmailState) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VerifyEmailView(),
                  ));
            }
          }
        },
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Image.asset(
                    Assets.illustration.login.path,
                    width: 200,
                    height: 200,
                  ),
                ),
                const SizedBox(
                  height: spaceBetweenLine12,
                ),
                Text(
                  AppText.txtSignInIntroduction,
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
                BlocBuilder<SignInBloc, SignInState>(
                  buildWhen: (previous, current) =>
                      current is SignInValidateState,
                  builder: (context, state) => Material(
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
                        hintText: AppText.txtEmail,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 16),
                          child: Icon(
                            Icons.email_rounded,
                            color: colorScheme.primary,
                            size: 24,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(radiusTextField)),
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
                        errorText: (state is SignInValidateState &&
                                state.emailError.isNotEmpty)
                            ? state.emailError
                            : null,
                      ),
                      onChanged: (value) => context.read<SignInBloc>().add(
                            SignInValidateEvent(
                                email: _emailController.text,
                                password: _passwordController.text),
                          ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: spaceBetweenLine12,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  buildWhen: (previous, current) =>
                      current is SignInValidateState,
                  builder: (context, state) => Material(
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
                        hintText: AppText.txtPassword,
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(left: 12, right: 16),
                          child: Icon(
                            Icons.key_rounded,
                            color: colorScheme.primary,
                            size: 24,
                          ),
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 12),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.transparent, width: 1),
                          borderRadius: BorderRadius.all(
                              Radius.circular(radiusTextField)),
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
                        errorText: (state is SignInValidateState &&
                                state.passwordError.isNotEmpty)
                            ? state.passwordError
                            : null,
                      ),
                      onChanged: (value) => context.read<SignInBloc>().add(
                            SignInValidateEvent(
                                email: _emailController.text,
                                password: _passwordController.text),
                          ),
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
                    child: Text(
                      AppText.txtForgotPassword,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(
                  height: spaceBetweenLine12,
                ),
                BlocBuilder<SignInBloc, SignInState>(
                  buildWhen: (previous, current) =>
                      current is SignInValidateState,
                  builder: (context, state) => AppFilledButton(
                    text: AppText.txtSignIn,
                    onPressed: (state is SignInValidateState &&
                            !state.forceDisabled)
                        ? () => context.read<SignInBloc>().add(SignInSendEvent(
                            email: _emailController.text,
                            password: _passwordController.text))
                        : null,
                    minimumSize: const Size.fromHeight(48),
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
                    Text(
                      AppText.txtNotAccount,
                      //style: TextStyle(color: colorScheme.primary),
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpView(),
                          )),
                      child: Text(
                        AppText.txtSignUp,
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
        ),
      );

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
