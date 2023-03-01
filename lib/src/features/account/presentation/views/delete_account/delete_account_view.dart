import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../blocs/delete_account_bloc/delete_account_bloc.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({Key? key}) : super(key: key);

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) => BlocListener<DeleteAccountBloc, DeleteAccountState>(
        listener: (context, state) async {
          if (state is DeleteAccountLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is DeleteAccountLoadDoneState) {
            } else if (state is DeleteAccountLoadErrorState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                  icon: const Icon(
                    Icons.error_outline,
                    color: AppColor.error,
                  ),
                  title: const Text(TextDoc.txtDeleteAccountResult),
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
            }
          }
        },
        child: Scaffold(
          backgroundColor: AppColor.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar.medium(
                title: const Text(
                  TextDoc.txtDeleteAccount,
                  style: TextStyle(
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
                  (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: padding16,
                      vertical: padding24,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Text(
                          TextDoc.txtEnterPasswordToDelete,
                          style: TextStyle(
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: AppColor.defaultFont,
                          ),
                        ),
                        BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
                          builder: (context, state) => AppOutlinedTextField(
                            controller: _controller,
                            obscureText: true,
                            errorText: state is DeleteAccountPasswordInvalidState ? state.message : null,
                            onChanged: (value) => context.read<DeleteAccountBloc>().add(
                                  DeleteAccountChangePasswordEvent(value),
                                ),
                          ),
                        ),
                        const SizedBox(height: spaceBetweenLine24),
                        BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
                          builder: (context, state) => AppElevatedButton(
                            text: TextDoc.txtConfirmDeleteAccount,
                            minimumSize: const Size.fromHeight(48),
                            onPressed: state is DeleteAccountPasswordValidState
                                ? () => context.read<DeleteAccountBloc>().add(
                                      const DeleteAccountDeleteEvent(),
                                    )
                                : null,
                          ),
                        ),
                        const SizedBox(height: smallSpacing8),
                        AppTextButton(
                          text: TextDoc.txtCancel,
                          minimumSize: const Size.fromHeight(48),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
