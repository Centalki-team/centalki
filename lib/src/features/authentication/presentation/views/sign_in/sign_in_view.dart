import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/text_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/sign_in_bloc/sign_in_bloc.dart';
import '../reset_password/reset_password_page.dart';
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
            _validateSignInInputs('');
          }
        },
        listenWhen: (previous, current) => previous != current,
        child: Scaffold(
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 280,
                    child: Assets.illustration.signIn.svg(),
                  ),
                  Text(
                    S.current.txtSignInIntroduction,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: titleLargeSize,
                      fontWeight: titleLargeWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  const SizedBox(height: spacing16),
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) => Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          S.current.txtEmail,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: colorsByTheme(context).defaultFont,
                          ),
                        ),
                        AppOutlinedTextField(
                          controller: _emailController,
                          textInputType: TextInputType.emailAddress,
                          errorText: (state is SignInValidateState &&
                                  state.emailError.isNotEmpty)
                              ? state.emailError
                              : null,
                          onChanged: _validateSignInInputs,
                        ),
                        const SizedBox(height: spacing8),
                        Text(
                          S.current.txtPassword,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: colorsByTheme(context).defaultFont,
                          ),
                        ),
                        AppOutlinedTextField(
                          controller: _passwordController,
                          obscureText: true,
                          errorText: (state is SignInValidateState &&
                                  state.passwordError.isNotEmpty)
                              ? state.passwordError
                              : null,
                          onChanged: _validateSignInInputs,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: spacing24),
                  BlocBuilder<SignInBloc, SignInState>(
                    builder: (context, state) {
                      if (state is SignInLoadingState) {
                        return const Center(
                          child: CupertinoActivityIndicator(),
                        );
                      }
                      return AppFilledButton(
                        text: S.current.txtSignIn,
                        onPressed: (state is SignInValidateState &&
                                !state.forceDisabled)
                            ? () =>
                                context.read<SignInBloc>().add(SignInSendEvent(
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ))
                            : null,
                        minimumSize: const Size.fromHeight(48),
                      );
                    },
                  ),
                  const SizedBox(height: spacing24),
                  Center(
                    child: Text(
                      S.current.txtOrLoginWith,
                      style: TextStyle(
                        fontSize: bodyLargeSize,
                        fontWeight: bodyLargeWeight,
                        color: colorsByTheme(context).defaultFont,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) => TextButton(
                          onPressed: () => context
                              .read<SignInBloc>()
                              .add(const GoogleSignInEvent()),
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: Image.asset(
                            Assets.logo.google.path,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      const SizedBox(width: spacing12),
                      BlocBuilder<SignInBloc, SignInState>(
                        builder: (context, state) => TextButton(
                          onPressed: () => context
                              .read<SignInBloc>()
                              .add(const FacebookSignInEvent()),
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                          ),
                          child: Image.asset(
                            Assets.logo.facebook.path,
                            width: 40,
                            height: 40,
                          ),
                        ),
                      ),
                      if (Platform.isIOS) ...[
                        const SizedBox(width: spacing12),
                        BlocBuilder<SignInBloc, SignInState>(
                          builder: (context, state) => TextButton(
                            onPressed: () => context
                                .read<SignInBloc>()
                                .add(const AppleSignInEvent()),
                            style: TextButton.styleFrom(
                              shape: const CircleBorder(),
                            ),
                            child: Image.asset(
                              Assets.logo.apple.path,
                              width: 40,
                              height: 40,
                            ),
                          ),
                        ),
                      ] else
                        ...[],
                    ],
                  ),
                  const SizedBox(height: spacing8),
                  AppTextButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ResetPasswordPage(),
                        )),
                    text: S.current.txtForgotPassword,
                  ),
                  const SizedBox(height: spacing8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.current.txtHaveNoAccount,
                        style: TextStyle(
                          fontSize: bodyMediumSize,
                          fontWeight: bodyMediumWeight,
                          color: colorsByTheme(context).defaultFont,
                        ),
                      ),
                      AppTextButton(
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpPage(),
                            )),
                        text: S.current.txtSignUp,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
