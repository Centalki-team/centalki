import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/sign_up_bloc/sign_up_bloc.dart';
import 'sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(),
        child: const SignUpView(),
      );
}
