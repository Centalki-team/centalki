import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/app_intro_bloc/app_intro_bloc.dart';
import 'app_intro_content.dart';

class AppIntroPage extends StatelessWidget {
  const AppIntroPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<AppIntroBloc>(
        create: (context) => AppIntroBloc(),
        child: const AppIntroContent(),
      );
}
