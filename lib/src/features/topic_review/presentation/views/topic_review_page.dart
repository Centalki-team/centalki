import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/topic_review_bloc/topic_review_bloc.dart';
import 'topic_review_view.dart';

class TopicReviewPage extends StatelessWidget {
  const TopicReviewPage({
    super.key,
    required this.topicId,
  });

  final String topicId;

  @override
  Widget build(BuildContext context) => BlocProvider<TopicReviewBloc>(
        create: (context) => TopicReviewBloc(),
        child: TopicReviewContent(
          topicId: topicId,
        ),
      );
}
