import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/intermediate_topics_bloc/intermediate_topics_bloc.dart';
import 'intermediate_topic_view.dart';

class IntermediateTopicPage extends StatelessWidget {
  const IntermediateTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocProvider<IntermediateTopicsBloc>(
        create: (context) => IntermediateTopicsBloc(),
        child: const IntermediateTopicsView(),
      );
}
