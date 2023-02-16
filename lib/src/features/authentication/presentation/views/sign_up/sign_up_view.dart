import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import 'terms.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _retypePasswordController = TextEditingController();
  bool _termsAccepted = false;

  void _validateSignUpInputs(String value) {
    context.read<SignUpBloc>().add(SignUpValidateEvent(
      fullname: _nameController.text,
      email: _emailController.text,
      password: _passwordController.text,
      retypePassword: _retypePasswordController.text,
      isTermsAccepted: _termsAccepted,
    ));
  }

  @override
  Widget build(BuildContext context) => BlocListener<SignUpBloc, SignUpState>(
    listener: (context, state) {
      if (state is SignUpErrorState) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(state.message),
          ),
        );
      }
    },
    child: Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            Image.asset(
              Assets.illustration.register.path,
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 16),
            Text(
              'Create new account',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: spaceBetweenLine18),
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) => Column(
                children: [
                  AppOutlinedTextField(
                    controller: _nameController,
                    labelText: 'Fullname',
                    errorText:
                    state is SignUpValidateState && state.fullnameError.isNotEmpty ? state.fullnameError : null,
                    onChanged: _validateSignUpInputs,
                  ),
                  const SizedBox(height: spaceBetweenLine12),
                  AppOutlinedTextField(
                    controller: _emailController,
                    labelText: 'Email',
                    textInputType: TextInputType.emailAddress,
                    errorText:
                    state is SignUpValidateState && state.emailError.isNotEmpty ? state.emailError : null,
                    onChanged: _validateSignUpInputs,
                  ),
                  const SizedBox(height: spaceBetweenLine12),
                  AppOutlinedTextField(
                    controller: _passwordController,
                    labelText: 'Password',
                    obscureText: true,
                    errorText:
                    state is SignUpValidateState && state.passwordError.isNotEmpty ? state.passwordError : null,
                    onChanged: _validateSignUpInputs,
                  ),
                  const SizedBox(height: spaceBetweenLine12),
                  AppOutlinedTextField(
                      controller: _retypePasswordController,
                      labelText: 'Retype Password',
                      obscureText: true,
                      errorText: state is SignUpValidateState && state.retypePasswordError.isNotEmpty
                          ? state.retypePasswordError
                          : null,
                      onChanged: _validateSignUpInputs
                  ),
                  const SizedBox(height: spaceBetweenLine15),
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

                          _validateSignUpInputs('');
                        },
                      ),
                      const Text('I accept', style: TextStyle(fontSize: 14)),
                      AppTextButton(
                        text: 'Terms & Conditions',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TermsAndConditions(),
                              ));
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: spaceBetweenLine15),
            BlocBuilder<SignUpBloc, SignUpState>(
              builder: (context, state) {
                if (state is SignUpLoadingState) {
                  return const Center(
                    child: CupertinoActivityIndicator(),
                  );
                }
                return AppFilledButton(
                  text: 'Sign Up',
                  minimumSize: const Size.fromHeight(48),
                  onPressed: state is SignUpValidateState && state.forceDisabled == false
                      ? () => context.read<SignUpBloc>().add(SignUpSubmitEvent(
                    email: _emailController.text,
                    password: _passwordController.text,
                  ))
                      : null,
                );
              },
            ),
            const SizedBox(height: spaceBetweenLine15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Have an account?'),
                const SizedBox(width: 4),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
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