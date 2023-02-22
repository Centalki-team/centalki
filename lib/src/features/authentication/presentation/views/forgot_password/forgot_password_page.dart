import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/forgot_password_bloc/forgot_password_bloc.dart';
import 'forgot_password_view.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ForgotPasswordBloc(),
        child: const ForgotPasswordView(),
      );
}
