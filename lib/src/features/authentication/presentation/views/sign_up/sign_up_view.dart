import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
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
                const SizedBox(height: spaceBetweenLine16),
                SizedBox(
                  height: 220,
                  child: Assets.illustration.signUp.svg(),
                ),
                const SizedBox(height: spaceBetweenLine20),
                Text(
                  TextDoc.txtSignUpIntroduction,
                  style: TextStyle(
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: spaceBetweenLine18),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) => Column(
                    children: [
                      AppOutlinedTextField(
                        controller: _nameController,
                        labelText: TextDoc.txtFullname,
                        errorText:
                            state is SignUpValidateState && state.fullnameError.isNotEmpty ? state.fullnameError : null,
                        onChanged: _validateSignUpInputs,
                      ),
                      const SizedBox(height: spaceBetweenLine12),
                      AppOutlinedTextField(
                        controller: _emailController,
                        labelText: TextDoc.txtEmail,
                        textInputType: TextInputType.emailAddress,
                        errorText:
                            state is SignUpValidateState && state.emailError.isNotEmpty ? state.emailError : null,
                        onChanged: _validateSignUpInputs,
                      ),
                      const SizedBox(height: spaceBetweenLine12),
                      AppOutlinedTextField(
                        controller: _passwordController,
                        labelText: TextDoc.txtPassword,
                        obscureText: true,
                        errorText:
                            state is SignUpValidateState && state.passwordError.isNotEmpty ? state.passwordError : null,
                        onChanged: _validateSignUpInputs,
                      ),
                      const SizedBox(height: spaceBetweenLine12),
                      AppOutlinedTextField(
                          controller: _retypePasswordController,
                          labelText: TextDoc.txtRetypePassword,
                          obscureText: true,
                          errorText: state is SignUpValidateState && state.retypePasswordError.isNotEmpty
                              ? state.retypePasswordError
                              : null,
                          onChanged: _validateSignUpInputs),
                      const SizedBox(height: spaceBetweenLine14),
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
                          Text(
                            TextDoc.txtTermsAccept,
                            style: const TextStyle(fontSize: 14),
                          ),
                          AppTextButton(
                            text: TextDoc.txtTerms,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TermsAndConditions(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: spaceBetweenLine14),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    if (state is SignUpLoadingState) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    return AppFilledButton(
                      text: TextDoc.txtSignUp,
                      minimumSize: const Size.fromHeight(48),
                      onPressed: state is SignUpValidateState && state.forceDisabled == false
                          ? () => context.read<SignUpBloc>().add(SignUpSubmitEvent(
                                fullname: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                              ))
                          : null,
                    );
                  },
                ),
                const SizedBox(height: spaceBetweenLine14),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(TextDoc.txtHaveAnAccount),
                    const SizedBox(width: 4),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        TextDoc.txtSignIn,
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
