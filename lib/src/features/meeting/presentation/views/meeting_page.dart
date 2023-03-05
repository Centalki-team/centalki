import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/meeting_bloc.dart';
import 'meeting_view.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => MeetingBloc()
          ..add(
            const MeetingInitEvent(),
          ),
        child: const MeetingView(),
      );
}
