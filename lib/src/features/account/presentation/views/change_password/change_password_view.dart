import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/text.dart';
import '../../blocs/change_password_bloc/change_password_bloc.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({Key? key}) : super(key: key);

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
                  builder: (context) => AlertDialog(
                        icon: const Icon(
                          Icons.error_outline,
                          color: error,
                        ),
                        title: Text(TextDoc.txtChangePasswordResult),
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
                              child: Text(TextDoc.txtOk)),
                        ],
                      ));
            } else if (state is ChangePasswordLoadDoneState) {
              await showDialog(
                  barrierDismissible: false,
                  context: context,
                  builder: (context) => AlertDialog(
                        icon: const Icon(
                          Icons.error_outline,
                          color: error,
                        ),
                        title: Text(TextDoc.txtChangePasswordResult),
                        content: Flexible(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(TextDoc.txtSuccessfullyChanged),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(TextDoc.txtOk)),
                        ],
                      ));
            }
          }
        },
        child: Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: Text(TextDoc.txtChangePassword),
                centerTitle: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  childCount: 1,
                  (_, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: screenAutoPadding16, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TextDoc.txtCurrentPassword,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => TextField(
                            onChanged: (value) => context
                                .read<ChangePasswordBloc>()
                                .add(ChangePasswordSendPasswordEvent(value)),
                            decoration: InputDecoration(
                              errorText:
                                  state is ChangePasswordInvalidInputState
                                      ? state.passwordError
                                      : null,
                              border: const OutlineInputBorder(),
                              errorBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: error,
                                ),
                              ),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: spaceBetweenLine12,
                        ),
                        Text(
                          TextDoc.txtNewPassword,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => TextField(
                            onChanged: (value) => context
                                .read<ChangePasswordBloc>()
                                .add(ChangePasswordSendNewPasswordEvent(value)),
                            decoration: InputDecoration(
                              errorText:
                                  state is ChangePasswordInvalidInputState
                                      ? state.newPasswordError
                                      : null,
                              border: const OutlineInputBorder(),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: error,
                              )),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: spaceBetweenLine12,
                        ),
                        Text(
                          TextDoc.txtConfirmPassword,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => TextField(
                            onChanged: (value) => context
                                .read<ChangePasswordBloc>()
                                .add(ChangePasswordSendConfirmPasswordEvent(
                                    value)),
                            decoration: InputDecoration(
                              errorText:
                                  state is ChangePasswordInvalidInputState
                                      ? state.confirmPasswordError
                                      : null,
                              border: const OutlineInputBorder(),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                color: error,
                              )),
                            ),
                            obscureText: true,
                          ),
                        ),
                        const SizedBox(
                          height: spaceBetweenLine20,
                        ),
                        BlocBuilder<ChangePasswordBloc, ChangePasswordState>(
                          builder: (context, state) => ElevatedButton(
                              onPressed: state is ChangePasswordValidInputState
                                  ? () => context
                                      .read<ChangePasswordBloc>()
                                      .add(const ChangePasswordChangeEvent())
                                  : null,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: secondary,
                                foregroundColor: Colors.white,
                                minimumSize: const Size.fromHeight(48),
                              ),
                              child: Text(TextDoc.txtChangePassword)),
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
