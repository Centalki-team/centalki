import 'package:centalki/src/features/topic/presentation/blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'package:centalki/src/features/topic/presentation/views/topic_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopicDetailPage extends StatelessWidget {
  const TopicDetailPage({Key? key, required this.topicId}) : super(key: key);

  final String topicId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicDetailBloc(),
      child: TopicDetailView(
        topicId: topicId,
      ),
    );
  }
}
