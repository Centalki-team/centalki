import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/text_field.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../blocs/reset_password_bloc/reset_password_bloc.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key});

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<ResetPasswordBloc, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is ResetPasswordLoadDoneState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            } else if (state is ResetPasswordLoadErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.message),
              ));
            }
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
                  child: Assets.illustration.resetPassword.svg(),
                ),
                const Text(
                  TextDoc.txtResetPasswordIntroduction,
                  style: TextStyle(
                    fontSize: titleLargeSize,
                    fontWeight: titleLargeWeight,
                    color: AppColor.defaultFontContainer,
                  ),
                ),
                const SizedBox(height: spaceBetweenLine16),
                BlocBuilder<ResetPasswordBloc, ResetPasswordState>(
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
                      AppOutlinedTextField(
                        controller: _emailController,
                        textInputType: TextInputType.emailAddress,
                        errorText: (state is ResetPasswordValidateState && state.emailError.isNotEmpty)
                            ? state.emailError
                            : null,
                        onChanged: (value) =>
                            context.read<ResetPasswordBloc>().add(ResetPasswordValidateEvent(email: value)),
                      ),
                      const SizedBox(height: spaceBetweenLine24),
                      AppFilledButton(
                        text: TextDoc.txtResetPassword,
                        onPressed: (state is ResetPasswordValidateState && !state.forceDisabled)
                            ? () => context
                                .read<ResetPasswordBloc>()
                                .add(ResetPasswordSendEvent(email: _emailController.text))
                            : null,
                        minimumSize: const Size.fromHeight(48),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: smallSpacing8),
                AppTextButton(
                  text: TextDoc.txtReturnSignIn,
                  onPressed: () => Navigator.pop(context),
                  minimumSize: const Size.fromHeight(48),
                ),
                const SizedBox(height: spaceBetweenLine16),
              ],
            ),
          ),
        ),
      );
}
