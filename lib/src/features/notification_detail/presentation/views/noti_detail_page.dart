import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/noti_detail_bloc/noti_detail_bloc.dart';
import 'noti_detail_view.dart';

class NotiDetailPage extends StatelessWidget {
  const NotiDetailPage({
    super.key,
    required this.notiId,
  });

  final String notiId;

  @override
  Widget build(BuildContext context) => BlocProvider<NotiDetailBloc>(
        create: (context) => NotiDetailBloc()
          ..add(
            NotiDetailLoadEvent(
              notiId: notiId,
            ),
          ),
        child: const NotiDetailView(),
      );
}
