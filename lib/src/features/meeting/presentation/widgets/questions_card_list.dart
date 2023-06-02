import 'package:flutter/material.dart';

import '../../../../../base/define/dimensions.dart';
import '../../../topic_detail/domain/entities/topic_detail_entity.dart';
import 'meeting_question_card.dart';

class QuestionsCardList extends StatelessWidget {
  const QuestionsCardList({
    super.key,
    this.questionsList = const [],
  });

  final List<TopicQuestionEntity> questionsList;

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.all(spacing16),
        shrinkWrap: true,
        itemBuilder: (context, index) => MeetingQuestionCard(
          index: index,
          questionContent: questionsList[index].questionContent ?? '',
          answers: questionsList[index].topicAnswers ?? [],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: spacing16,
        ),
        itemCount: questionsList.length,
      );
}
