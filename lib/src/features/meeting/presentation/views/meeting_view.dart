import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            await Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const HangUpMeetingView()));
            if (mounted) {
              Navigator.pop(context);
            }
          }
        },
        builder: (context, state) => const Scaffold(
          body: Center(),
        ),
      );
}
