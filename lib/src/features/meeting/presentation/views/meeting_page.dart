import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../connect_teacher/domain/entities/session_schedule_entity.dart';
import '../blocs/meeting_bloc.dart';
import 'meeting_view.dart';

class MeetingPage extends StatelessWidget {
  const MeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final session =
        ModalRoute.of(context)!.settings.arguments as SessionScheduleEntity;
    return BlocProvider(
      create: (context) => MeetingBloc()
        ..add(
          MeetingInitEvent(session: session),
        ),
      child: const MeetingView(),
    );
  }
}
