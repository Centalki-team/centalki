import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/topic_level_bloc/topic_level_bloc.dart';
import '../blocs/topics_bloc/topics_bloc.dart';
import 'select_topic_view.dart';

class SelectTopicPage extends StatelessWidget {
  const SelectTopicPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TopicsBloc>(
          create: (context) => TopicsBloc()..add(const TopicsLoadEvent()),
        ),
        BlocProvider<TopicLevelBloc>(
          create: (context) => TopicLevelBloc()
            ..add(
              const TopicLevelChangeTabEvent(
                desTab: 0,
              ),
            ),
        ),
      ],
      child: const SelectTopicView(),
    );
  }
}
