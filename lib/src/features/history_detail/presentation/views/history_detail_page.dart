import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../connect_teacher/domain/entities/session_schedule_entity.dart';
import '../blocs/history_detail_bloc.dart';
import 'history_detail_view.dart';

class HistoryDetailPage extends StatelessWidget {
  const HistoryDetailPage({super.key, required this.session});

  final SessionScheduleEntity session;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HistoryDetailBloc(),
        child: HistoryDetailView(
          session: session,
        ),
      );
}
