import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/text_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../forgot_password/forgot_password_page.dart';
import '../sign_up/sign_up_page.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key}) : super(key: key);

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _validateSignInInputs(String value) {
    context.read<SignInBloc>().add(SignInValidateEvent(
          email: _emailController.text,
          password: _passwordController.text,
        ));
  }

  @override
  Widget build(BuildContext context) => BlocListener<SignInBloc, SignInState>(
        listener: (context, state) {
          if (state is SignInLoadErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
            context.read<SignInBloc>().add(SignInValidateEvent(
                  email: _emailController.text,
                  password: _passwordController.text,
                ));
          }
        },
        listenWhen: (previous, current) => previous != current,
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 280,
                  child: Assets.illustration.signIn.svg(),
                ),
                const Text(
                  TextDoc.txtSignInIntroduction,
                  style: TextStyle(
                    fontSize: titleLargeSize,
                    fontWeight: titleLargeWeight,
                    color: AppColor.defaultFontContainer,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: spaceBetweenLine20),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        TextDoc.txtEmail,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      const SizedBox(height: smallSpacing8),
                      AppOutlinedTextField(
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                        errorText:
                            (state is SignInValidateState && state.emailError.isNotEmpty) ? state.emailError : null,
                        onChanged: _validateSignInInputs,
                      ),
                      const SizedBox(height: spaceBetweenLine16),
                      const Text(
                        TextDoc.txtPassword,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      const SizedBox(height: smallSpacing8),
                      AppOutlinedTextField(
                        controller: _passwordController,
                        obscureText: true,
                        errorText: (state is SignInValidateState && state.passwordError.isNotEmpty)
                            ? state.passwordError
                            : null,
                        onChanged: _validateSignInInputs,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: spaceBetweenLine24),
                BlocBuilder<SignInBloc, SignInState>(
                  builder: (context, state) {
                    if (state is SignInLoadingState) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    return AppFilledButton(
                      text: TextDoc.txtSignIn,
                      onPressed: (state is SignInValidateState && !state.forceDisabled)
                          ? () => context.read<SignInBloc>().add(SignInSendEvent(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ))
                          : null,
                      minimumSize: const Size.fromHeight(48),
                    );
                  },
                ),
                const SizedBox(height: smallSpacing8),
                AppTextButton(
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ForgotPasswordPage(),
                      )),
                  text: TextDoc.txtForgotPassword,
                ),
                const SizedBox(height: spaceBetweenLine16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      TextDoc.txtHaveNoAccount,
                      style: TextStyle(
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                    AppTextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpPage(),
                          )),
                      text: TextDoc.txtSignUp,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
