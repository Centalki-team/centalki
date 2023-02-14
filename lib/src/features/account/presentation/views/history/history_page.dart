import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/history_bloc/history_bloc.dart';
import 'history_view.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => HistoryBloc()..add(const HistoryInitEvent()),
        child: const HistoryView(),
      );
}
