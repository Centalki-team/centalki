import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/noti_list_bloc/noti_list_bloc.dart';
import 'noti_list_view.dart';

class NotiListPage extends StatelessWidget {
  const NotiListPage({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider<NotiListBloc>(
        create: (context) => NotiListBloc()
          ..add(
            const NotiListLoadDataEvent(),
          ),
        child: const NotiListView(),
      );
}
