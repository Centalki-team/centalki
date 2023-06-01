import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/dialog/success_dialog_content.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../generated/l10n.dart';
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
                  title: S.current.txtChangePasswordResult,
                  content: state.message,
                ),
              );
            } else if (state is ChangePasswordLoadDoneState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => SuccessDialogContent(
                  title: S.current.txtChangePasswordResult,
                  content: S.current.txtSuccessfullyChanged,
                ),
              );
            }
          }
        },
        child: Scaffold(
          //backgroundColor: AppColor.white,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: CustomScrollView(
              slivers: [
                SliverAppBar.medium(
                  expandedHeight: sliverAppBarHeight,
                  leading: IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  title: Text(
                    S.current.txtChangePassword,
                    style: TextStyle(
                      height: 1.0,
                      fontSize: headlineSmallSize,
                      fontWeight: headlineSmallWeight,
                      color: colorsByTheme(context).defaultFont,
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
                          Text(
                            S.current.txtThirdPartyChangePassword,
                            style: const TextStyle(
                              fontSize: titleMediumSize,
                              fontWeight: bodyLargeWeight,
                              color: AppColor.error,
                              height: 1,
                            ),
                          ),
                          const SizedBox(height: spacing8),
                          Text(
                            S.current.txtCurrentPassword,
                            style: TextStyle(
                              fontSize: titleMediumSize,
                              fontWeight: titleMediumWeight,
                              color: colorsByTheme(context).defaultFont,
                            ),
                          ),
                          BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                            builder: (context, state) => AppOutlinedTextField(
                              controller: _currentPasswordController,
                              obscureText: true,
                              errorText:
                                  state is ChangePasswordInvalidInputState
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
                          Text(
                            S.current.txtNewPassword,
                            style: TextStyle(
                              fontSize: titleMediumSize,
                              fontWeight: titleMediumWeight,
                              color: colorsByTheme(context).defaultFont,
                            ),
                          ),
                          BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                            builder: (context, state) => AppOutlinedTextField(
                              controller: _newPasswordController,
                              obscureText: true,
                              errorText:
                                  state is ChangePasswordInvalidInputState
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
                          Text(
                            S.current.txtConfirmPassword,
                            style: TextStyle(
                              fontSize: titleMediumSize,
                              fontWeight: titleMediumWeight,
                              color: colorsByTheme(context).defaultFont,
                            ),
                          ),
                          BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                            builder: (context, state) => AppOutlinedTextField(
                              controller: _confirmPasswordController,
                              obscureText: true,
                              errorText:
                                  state is ChangePasswordInvalidInputState
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
                              text: S.current.txtChangePassword,
                              minimumSize: const Size.fromHeight(48),
                              onPressed: state is ChangePasswordValidInputState
                                  ? () =>
                                      context.read<ChangePasswordBloc>().add(
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
        ),
      );
}
