import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/topic_level_bloc/topic_level_bloc.dart';
import 'select_topic_level_view.dart';

class SelectTopicLevelPage extends StatelessWidget {
  const SelectTopicLevelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TopicLevelBloc()
        ..add(
          const TopicLevelChangeTabEvent(
            desTab: 0,
          ),
        ),
      child: const SelectTopicLevelView(),
    );
  }
}
