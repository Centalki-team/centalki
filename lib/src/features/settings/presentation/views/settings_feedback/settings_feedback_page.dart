import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/settings_feedback_bloc/settings_feedback_bloc.dart';
import 'settings_feedback_view.dart';

class SettingsFeedbackPage extends StatelessWidget {
  const SettingsFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SettingsFeedbackBloc(),
        child: const SettingsFeedbackView(),
      );
}
