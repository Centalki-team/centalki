import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../blocs/change_password_bloc/change_password_bloc.dart';

class ChangePasswordView extends StatefulWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

  @override
  State<ChangePasswordView> createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) async {
          if (state is ChangePasswordLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is ChangePasswordLoadErrorState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  icon: const Icon(
                    Icons.error_outline,
                    color: AppColor.error,
                  ),
                  title: const Text(TextDoc.txtChangePasswordResult),
                  content: Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(state.message),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(TextDoc.txtOk),
                    ),
                  ],
                ),
              );
            } else if (state is ChangePasswordLoadDoneState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  icon: const Icon(
                    Icons.error_outline,
                    color: AppColor.error,
                  ),
                  title: const Text(TextDoc.txtChangePasswordResult),
                  content: Flexible(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(TextDoc.txtSuccessfullyChanged),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(TextDoc.txtOk),
                    ),
                  ],
                ),
              );
            }
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: const Text(
                  TextDoc.txtChangePassword,
                  style: TextStyle(
                    height: 1.0,
                    fontSize: headlineSmallSize,
                    fontWeight: headlineSmallWeight,
                    color: AppColor.defaultFont,
                  ),
                ),
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: padding16, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          TextDoc.txtCurrentPassword,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: AppColor.defaultFont,
                          ),
                        ),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => AppOutlinedTextField(
                            controller: _currentPasswordController,
                            obscureText: true,
                            errorText: state is ChangePasswordInvalidInputState ? state.passwordError : null,
                            onChanged: (value) => context.read<ChangePasswordBloc>().add(
                                  ChangePasswordSendPasswordEvent(value),
                                ),
                          ),
                        ),
                        const SizedBox(height: spacing16),
                        const Text(
                          TextDoc.txtNewPassword,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: AppColor.defaultFont,
                          ),
                        ),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => AppOutlinedTextField(
                            controller: _newPasswordController,
                            obscureText: true,
                            errorText: state is ChangePasswordInvalidInputState ? state.newPasswordError : null,
                            onChanged: (value) => context.read<ChangePasswordBloc>().add(
                                  ChangePasswordSendNewPasswordEvent(value),
                                ),
                          ),
                        ),
                        const SizedBox(height: spacing12),
                        const Text(
                          TextDoc.txtConfirmPassword,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: AppColor.defaultFont,
                          ),
                        ),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => AppOutlinedTextField(
                            controller: _confirmPasswordController,
                            obscureText: true,
                            errorText: state is ChangePasswordInvalidInputState ? state.confirmPasswordError : null,
                            onChanged: (value) => context.read<ChangePasswordBloc>().add(
                                  ChangePasswordSendConfirmPasswordEvent(value),
                                ),
                          ),
                        ),
                        const SizedBox(height: spacing24),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => AppElevatedButton(
                            text: TextDoc.txtChangePassword,
                            minimumSize: const Size.fromHeight(48),
                            onPressed: state is ChangePasswordValidInputState
                                ? () => context.read<ChangePasswordBloc>().add(
                                      const ChangePasswordChangeEvent(),
                                    )
                                : null,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
