import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'topic_detail_view.dart';

class TopicDetailPage extends StatelessWidget {
  const TopicDetailPage({Key? key, required this.topicId}) : super(key: key);

  final String topicId;

  @override
  Widget build(BuildContext context) => BlocProvider(
      create: (context) => TopicDetailBloc()
        ..add(TopicDetailLoadEvent(
          topicId: topicId,
        )),
      child: const TopicDetailView(),
    );
}
