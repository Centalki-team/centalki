import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
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
  Widget build(BuildContext context) =>
      BlocListener<ChangePasswordBloc, ChangePasswordState>(
        listener: (context, state) async {
          if (state is ChangePasswordLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is ChangePasswordLoadErrorState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: TextDoc.txtChangePasswordResult,
                  content: state.message,
                ),
              );
            } else if (state is ChangePasswordLoadDoneState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => const SuccessDialogContent(
                  title: TextDoc.txtChangePasswordResult,
                  content: TextDoc.txtSuccessfullyChanged,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: padding16, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Watch out
                        const Text(
                          TextDoc.txtThirdPartyChangePassword,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: bodyLargeWeight,
                            color: AppColor.error,
                            height: 1,
                          ),
                        ),
                        const SizedBox(height: spacing8),
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
                            errorText: state is ChangePasswordInvalidInputState
                                ? state.passwordError
                                : null,
                            onChanged: (value) =>
                                context.read<ChangePasswordBloc>().add(
                                      ChangePasswordSendPasswordEvent(
                                        _currentPasswordController.text,
                                        _newPasswordController.text,
                                        _confirmPasswordController.text,
                                      ),
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
                            errorText: state is ChangePasswordInvalidInputState
                                ? state.newPasswordError
                                : null,
                            onChanged: (value) =>
                                context.read<ChangePasswordBloc>().add(
                                      ChangePasswordSendPasswordEvent(
                                        _currentPasswordController.text,
                                        _newPasswordController.text,
                                        _confirmPasswordController.text,
                                      ),
                                    ),
                          ),
                        ),
                        const SizedBox(height: spacing16),
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
                            errorText: state is ChangePasswordInvalidInputState
                                ? state.confirmPasswordError
                                : null,
                            onChanged: (value) =>
                                context.read<ChangePasswordBloc>().add(
                                      ChangePasswordSendPasswordEvent(
                                        _currentPasswordController.text,
                                        _newPasswordController.text,
                                        _confirmPasswordController.text,
                                      ),
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
