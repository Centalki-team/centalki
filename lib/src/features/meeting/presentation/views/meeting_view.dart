import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/meeting_bloc.dart';

class MeetingView extends StatelessWidget {
  const MeetingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocConsumer<MeetingBloc, MeetingState>(
        listener: (context, state) {
          if (state is MeetingEndState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) => const Scaffold(
          body: Center(
            child: Text('Meeting page'),
          ),
        ),
      );
}