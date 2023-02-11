import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/change_password_bloc/change_password_bloc.dart';
import 'change_password_view.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => ChangePasswordBloc(),
      child: const ChangePasswordView(),
    );
}
