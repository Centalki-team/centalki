import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/reset_password_bloc/reset_password_bloc.dart';
import 'reset_password_view.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ResetPasswordBloc(),
        child: const ResetPasswordView(),
      );
}
