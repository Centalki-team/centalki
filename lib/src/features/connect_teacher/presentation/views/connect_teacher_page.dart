import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/connect_teacher_bloc.dart';
import 'connect_teacher_view.dart';

class ConnectTeacherPage extends StatelessWidget {
  const ConnectTeacherPage({Key? key, required this.sessionId})
      : super(key: key);

  final String sessionId;

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) =>
            ConnectTeacherBloc()..add(ConnectTeacherInit(sessionId)),
        child: const ConnectTeacherView(),
      );
}
