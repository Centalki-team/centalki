import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/button.dart';
import '../../../../../../base/widgets/dialog/error_dialog_content.dart';
import '../../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../../generated/l10n.dart';
import '../../blocs/delete_account_bloc/delete_account_bloc.dart';

class DeleteAccountView extends StatefulWidget {
  const DeleteAccountView({Key? key}) : super(key: key);

  @override
  State<DeleteAccountView> createState() => _DeleteAccountViewState();
}

class _DeleteAccountViewState extends State<DeleteAccountView> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) =>
      BlocListener<DeleteAccountBloc, DeleteAccountState>(
        listener: (context, state) async {
          if (state is DeleteAccountLoadingState) {
            LoadingManager.setLoading(context, loading: true);
          } else {
            LoadingManager.setLoading(context);
            if (state is DeleteAccountLoadDoneState) {
              Navigator.pop(context);
            } else if (state is DeleteAccountLoadErrorState) {
              await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => ErrorDialogContent(
                  title: S.current.txtDeleteAccountResult,
                  content: state.message,
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
                  leading: IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  title: Text(
                    S.current.txtDeleteAccount,
                    style: TextStyle(
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
                    (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: padding16,
                        vertical: padding24,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            S.current.txtEnterPasswordToDelete,
                            style: TextStyle(
                              fontSize: titleMediumSize,
                              fontWeight: titleMediumWeight,
                              color: colorsByTheme(context).defaultFont,
                            ),
                          ),
                          BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
                            builder: (context, state) => AppOutlinedTextField(
                              controller: _controller,
                              obscureText: true,
                              errorText:
                                  state is DeleteAccountPasswordInvalidState
                                      ? state.message
                                      : null,
                              onChanged: (value) =>
                                  context.read<DeleteAccountBloc>().add(
                                        DeleteAccountChangePasswordEvent(value),
                                      ),
                            ),
                          ),
                          const SizedBox(height: spacing24),
                          BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
                            builder: (context, state) => AppElevatedButton(
                              text: S.current.txtConfirmDeleteAccount,
                              minimumSize: const Size.fromHeight(48),
                              onPressed: state
                                      is DeleteAccountPasswordValidState
                                  ? () => context.read<DeleteAccountBloc>().add(
                                        const DeleteAccountDeleteEvent(),
                                      )
                                  : null,
                            ),
                          ),
                          const SizedBox(height: spacing8),
                          AppTextButton(
                            text: S.current.txtCancel,
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
        ),
      );
}
