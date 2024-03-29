import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import '../self_review/self_review_page.dart';
import 'terms.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

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
  Widget build(BuildContext context) => Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 280,
                  child: Assets.illustration.signUpIllustration.image(),
                ),
                Text(
                  S.current.txtSignUpIntroduction,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: titleLargeSize,
                    fontWeight: titleLargeWeight,
                    height: 30 / 28,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
                const SizedBox(height: spacing16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) => Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        S.current.txtFullName,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: colorsByTheme(context).defaultFont,
                        ),
                      ),
                      AppOutlinedTextField(
                        controller: _nameController,
                        errorText: state is SignUpValidateState &&
                                state.fullnameError.isNotEmpty
                            ? state.fullnameError
                            : null,
                        onChanged: _validateSignUpInputs,
                      ),
                      const SizedBox(height: spacing8),
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
                        errorText: state is SignUpValidateState &&
                                state.emailError.isNotEmpty
                            ? state.emailError
                            : null,
                        onChanged: _validateSignUpInputs,
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
                        errorText: state is SignUpValidateState &&
                                state.passwordError.isNotEmpty
                            ? state.passwordError
                            : null,
                        onChanged: _validateSignUpInputs,
                      ),
                      const SizedBox(height: spacing8),
                      Text(
                        S.current.txtRetypePassword,
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: colorsByTheme(context).defaultFont,
                        ),
                      ),
                      AppOutlinedTextField(
                          controller: _retypePasswordController,
                          obscureText: true,
                          errorText: state is SignUpValidateState &&
                                  state.retypePasswordError.isNotEmpty
                              ? state.retypePasswordError
                              : null,
                          onChanged: _validateSignUpInputs),
                      const SizedBox(height: spacing8),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            activeColor: AppColor.mainColor2,
                            value: _termsAccepted,
                            onChanged: (value) {
                              setState(() {
                                _termsAccepted = value!;
                              });

                              _validateSignUpInputs('');
                            },
                          ),
                          Text(
                            S.current.txtTermsAccept,
                            style: TextStyle(
                              fontSize: bodyMediumSize,
                              fontWeight: bodyMediumWeight,
                              color: colorsByTheme(context).defaultFont,
                            ),
                          ),
                          AppTextButton(
                            text: S.current.txtTerms,
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TermsAndConditions(),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: spacing16),
                BlocBuilder<SignUpBloc, SignUpState>(
                  builder: (context, state) {
                    if (state is SignUpLoadingState) {
                      return const Center(
                        child: CupertinoActivityIndicator(),
                      );
                    }
                    return AppFilledButton(
                      text: S.current.txtNext,
                      minimumSize: const Size.fromHeight(48),
                      onPressed: state is SignUpValidateState &&
                              state.forceDisabled == false
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context2) => BlocProvider.value(
                                    value: BlocProvider.of<SignUpBloc>(context),
                                    child: SelfReviewPage(
                                      onSignUp: () => context
                                          .read<SignUpBloc>()
                                          .add(SignUpSubmitEvent(
                                            fullname: _nameController.text,
                                            email: _emailController.text,
                                            password: _passwordController.text,
                                          )),
                                    ),
                                  ),
                                ),
                              );
                            }
                          : null,
                    );
                  },
                ),
                const SizedBox(height: spacing8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      S.current.txtHaveAnAccount,
                      style: TextStyle(
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                        color: colorsByTheme(context).defaultFont,
                      ),
                    ),
                    const SizedBox(width: spacing4),
                    AppTextButton(
                      text: S.current.txtSignIn,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
}
