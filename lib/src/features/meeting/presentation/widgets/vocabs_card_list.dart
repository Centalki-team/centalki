import 'package:flutter/material.dart';

import '../../../../../base/define/dimensions.dart';
import '../../../topic_detail/domain/entities/topic_detail_entity.dart';
import 'meeting_vocab_card.dart';

class VocabsCardList extends StatelessWidget {
  const VocabsCardList({
    super.key,
    this.vocabsList = const [],
  });

  final List<TopicPhraseEntity> vocabsList;

  @override
  Widget build(BuildContext context) => ListView.separated(
        padding: const EdgeInsets.all(spacing16),
        shrinkWrap: true,
        itemBuilder: (context, index) => MeetingVocabCard(
          phraseEntity: vocabsList[index],
        ),
        separatorBuilder: (context, index) => const SizedBox(
          height: spacing16,
        ),
        itemCount: vocabsList.length,
      );
}
