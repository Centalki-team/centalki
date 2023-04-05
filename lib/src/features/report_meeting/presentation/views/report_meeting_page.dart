import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/report_meeting_bloc.dart';
import 'report_meeting_view.dart';

class ReportMeetingPage extends StatelessWidget {
  const ReportMeetingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => ReportMeetingBloc(),
        child: const ReportMeetingView(),
      );
}
