import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/delete_account_bloc/delete_account_bloc.dart';
import 'delete_account_view.dart';

class DeleteAccountPage extends StatelessWidget {
  const DeleteAccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => DeleteAccountBloc(),
      child: const DeleteAccountView(),
    );
}
