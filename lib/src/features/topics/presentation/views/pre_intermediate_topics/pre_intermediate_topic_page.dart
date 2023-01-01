import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/pre_intermediate_topic_bloc/pre_intermediate_topics_bloc.dart';
import 'pre_intermediate_topic_view.dart';

class PreIntermediateTopicPage extends StatelessWidget {
  const PreIntermediateTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PreIntermediateTopicsBloc()
        ..add(
          const PreIntermediateTopicsLoadEvent(),
        ),
      child: const PreIntermediateTopicView(),
    );
  }
}
