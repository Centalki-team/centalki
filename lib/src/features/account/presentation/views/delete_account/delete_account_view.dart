import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/manager/loading_manager.dart';
import '../../../../../../base/define/text.dart';
import '../../blocs/delete_account/delete_account_bloc.dart';

class DeleteAccountView extends StatelessWidget {
  const DeleteAccountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<DeleteAccountBloc, DeleteAccountState>(
      listener: (context, state) async {
        if (state is DeleteAccountLoadingState) {
          LoadingManager.setLoading(true, context);
        } else {
          LoadingManager.setLoading(false, context);
          if (state is DeleteAccountLoadDoneState) {
          } else if (state is DeleteAccountLoadErrorState) {
            await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => AlertDialog(
                      icon: const Icon(
                        Icons.error_outline,
                        color: error,
                      ),
                      title: const Text('Delete result'),
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
                            child: const Text('OK')),
                      ],
                    ));
          }
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(
              screenAutoPadding16, 24.0, screenAutoPadding16, 0),
          child: Column(
            children: [
              const Text(
                'Confirm delete',
                style: TextStyle(
                  fontSize: 24,
                  //fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: spaceBetweenLine20,
              ),
              Row(
                children: [
                  Text(
                    TextDoc.txtPassword,
                  ),
                ],
              ),
              const SizedBox(
                height: smallSpacing8,
              ),
              BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
                builder: (context, state) {
                  return TextField(
                    onChanged: (value) => context
                        .read<DeleteAccountBloc>()
                        .add(DeleteAccountChangePasswordEvent(value)),
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: error,
                        ),
                      ),
                      errorText: state is DeleteAccountPasswordInvalidState
                          ? state.message
                          : null,
                    ),
                  );
                },
              ),
              const SizedBox(
                height: spaceBetweenLine18,
              ),
              BlocBuilder<DeleteAccountBloc, DeleteAccountState>(
                builder: (context, state) {
                  return ElevatedButton(
                      onPressed: state is DeleteAccountPasswordValidState
                          ? () => context
                              .read<DeleteAccountBloc>()
                              .add(const DeleteAccountDeleteEvent())
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: secondary,
                        foregroundColor: Colors.white,
                        minimumSize: const Size.fromHeight(48),
                      ),
                      child: const Text('Confirm'));
                },
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
