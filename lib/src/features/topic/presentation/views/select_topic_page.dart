import 'package:centalki/src/features/topic/presentation/blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'package:centalki/src/features/topic/presentation/blocs/topic_level_bloc/topic_level_bloc.dart';
import 'package:centalki/src/features/topic/presentation/blocs/topics_bloc/topics_bloc.dart';
import 'package:centalki/src/features/topic/presentation/views/select_topic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectTopicPage extends StatelessWidget {
  const SelectTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopicsBloc>(create: (context) => TopicsBloc()),
        BlocProvider<TopicDetailBloc>(create: (context) => TopicDetailBloc()),
        BlocProvider<TopicLevelBloc>(create: (context) => TopicLevelBloc()),
      ],
      child: const SelectTopicView(),
    );
  }
}
