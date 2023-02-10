import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/sign_in_bloc/sign_in_bloc.dart';
import 'sign_in_view.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(),
        child: const SignInView(),
      );
}
