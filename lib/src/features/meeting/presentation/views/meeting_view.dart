import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../report_meeting/presentation/views/report_meeting_view.dart';
import '../../../session_feedback/presentation/views/session_completed_view.dart';
import '../blocs/meeting_bloc.dart';
import 'hang_up_meeting_view.dart';

class MeetingView extends StatefulWidget {
  const MeetingView({Key? key}) : super(key: key);

  @override
  State<MeetingView> createState() => _MeetingViewState();
}

class _MeetingViewState extends State<MeetingView> {
  @override
  Widget build(BuildContext context) => BlocConsumer<MeetingBloc, MeetingState>(
        listener: (context, state) async {
          if (state is MeetingEndState) {
            var rejoin = false;
            if (state.notCompleted) {
              rejoin = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HangUpMeetingView(),
                          settings: RouteSettings(
                            arguments: state.session,
                          ))) ??
                  false;
              if (mounted) {
                if (rejoin) {
                  context.read<MeetingBloc>().add(
                        MeetingInitEvent(session: state.session),
                      );
                } else {
                  Navigator.pop(context);
                }
              }
            } else {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SessionCompletedView(),
                  settings: RouteSettings(
                    arguments: ScreenArguments(
                        state.session.sessionTeacher?.id ?? "",
                        state.session.sessionId),
                  ),
                ),
              );
              if (mounted) {
                Navigator.pop(context);
              }
            }
          }
        },
        builder: (context, state) => const Scaffold(
          body: Center(),
        ),
      );
}
