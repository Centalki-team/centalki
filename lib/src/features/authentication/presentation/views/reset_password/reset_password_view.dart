import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../../base/widgets/text_fields/text_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/reset_password_bloc/reset_password_bloc.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _emailController = TextEditingController();

  late Timer _timer;
  ValueNotifier<int> _start = ValueNotifier(0);

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _start = ValueNotifier(60);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start.value == 0) {
          timer.cancel();
          context
              .read<ResetPasswordBloc>()
              .add(ResetPasswordValidateEvent(email: _emailController.text));
        } else {
          --_start.value;
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) async {
          if (state is ResetPasswordLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is ResetPasswordLoadDoneState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => SuccessDialogContent(
                  title: S.current.txtResetPasswordResult,
                  content: state.message,
                ),
              );
            } else if (state is ResetPasswordLoadErrorState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: S.current.txtResetPasswordResult,
                  content: state.message,
                ),
              );
            }
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
                    child:
                        Assets.illustration.forgotPasswordIllustration.image(),
                  ),
                  Text(
                    S.current.txtResetPasswordIntroduction,
                    style: TextStyle(
                      fontSize: titleLargeSize,
                      fontWeight: titleLargeWeight,
                      height: 30 / 28,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  const SizedBox(height: spacing16),
                  BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
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
                          errorText: (state is ResetPasswordValidateState &&
                                  state.emailError.isNotEmpty)
                              ? state.emailError
                              : null,
                          onChanged: (value) => context
                              .read<ResetPasswordBloc>()
                              .add(ResetPasswordValidateEvent(email: value)),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _start,
                          builder: (_, value, __) => value > 0
                              ? Column(
                                  children: [
                                    const SizedBox(height: spacing24),
                                    Text(
                                      S.current.txtResetPasswordDescription,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: bodySmallSize,
                                        fontWeight: bodySmallWeight,
                                        height: 20 / 16,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                    ),
                                  ],
                                )
                              : Container(),
                        ),
                        const SizedBox(height: spacing24),
                        ValueListenableBuilder(
                          valueListenable: _start,
                          builder: (_, value, __) => AppFilledButton(
                            text: value > 0
                                ? '${S.current.txtResetPassword} ($value)'
                                : S.current.txtResetPassword,
                            onPressed: (state is ResetPasswordValidateState &&
                                    !state.forceDisabled &&
                                    value == 0)
                                ? () => {
                                      context.read<ResetPasswordBloc>().add(
                                          ResetPasswordSendEvent(
                                              email: _emailController.text)),
                                      startTimer(),
                                    }
                                : null,
                            minimumSize: const Size.fromHeight(48),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: spacing8),
                  AppTextButton(
                    text: S.current.txtReturnToSignIn,
                    onPressed: () => Navigator.pop(context),
                    minimumSize: const Size.fromHeight(48),
                  ),
                  const SizedBox(height: spacing16),
                ],
              ),
            ),
          ),
        ),
      );
}
