import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/dimensions.dart';
import '../../blocs/pre_intermediate_topic_bloc/pre_intermediate_topics_bloc.dart';
import '../../widgets/topic_card.dart';


class PreIntermediateTopicView extends StatefulWidget {
  const PreIntermediateTopicView({Key? key}) : super(key: key);

  @override
  State<PreIntermediateTopicView> createState() => _PreIntermediateTopicViewState();
}

class _PreIntermediateTopicViewState extends State<PreIntermediateTopicView> {
  @override
  Widget build(BuildContext context) => BlocBuilder<PreIntermediateTopicsBloc, PreIntermediateTopicsState>(
      builder: (context, state) {
        if (state is PreIntermediateTopicsLoadDoneState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: screenAutoPadding16),
            child: ListView.separated(
              padding: const EdgeInsets.only(top: 16),
              itemCount: state.topics.topics!.length,
              separatorBuilder: (context, index) => const SizedBox(height: smallSpacing8),
              itemBuilder: (context, index) => TopicCard(
                  item: state.topics.topics![index],
                ),
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
}
