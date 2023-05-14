import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../blocs/upper_intermediate_topics_bloc/upper_intermediate_topics_bloc.dart';
import 'upper_intermediate_topic_view.dart';

class UpperIntermediateTopicPage extends StatelessWidget {
  const UpperIntermediateTopicPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      BlocProvider<UpperIntermediateTopicsBloc>(
        create: (context) => UpperIntermediateTopicsBloc(),
        child: const UpperIntermediateTopicView(),
      );
}
