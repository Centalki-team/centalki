import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/session_give_feedback_bloc/session_give_feedback_bloc.dart';
import 'session_give_feedback_view.dart';

class SessionGiveFeedbackPage extends StatelessWidget {
  const SessionGiveFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SessionGiveFeedbackBloc(),
        child: const SessionGiveFeedbackView(),
      );
}
