import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../domain/entities/topic_detail_entity.dart';

class PhraseCard extends StatelessWidget {
  const PhraseCard({
    Key? key,
    required this.phraseEntity,
  }) : super(key: key);

  final TopicPhraseEntity phraseEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            phraseEntity.topicPhrase ?? 'null',
            style: TextStyle(
              fontSize: titleMediumSize,
              fontWeight: titleMediumWeight,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: smallSpacing4),
          ...phraseEntity.phraseMeanings!.map(
            (e) => Text(
              e,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
          const SizedBox(height: smallSpacing4),
          const Text(
            'Example',
            style: TextStyle(
              fontSize: bodyMediumSize,
              fontWeight: bodyMediumWeight,
            ),
          ),
          ...phraseEntity.phraseExamples!.map(
            (e) => Text(
              e.phraseExample ?? 'null example',
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// return Container(
// padding: const EdgeInsets.all(8),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Text(
// 'exercise (noun, countable)',
// style: TextStyle(
// fontSize: titleMediumSize,
// fontWeight: titleMediumWeight,
// color: colorScheme.primary,
// ),
// ),
// const SizedBox(height: smallSpacing4),
// const Text(
// 'bài thể dục\nbài tập',
// style: TextStyle(
// fontSize: labelLargeSize,
// fontWeight: labelLargeWeight,
// ),
// ),
// const SizedBox(height: smallSpacing4),
// const Text(
// 'Example',
// style: TextStyle(
// fontSize: bodyMediumSize,
// fontWeight: bodyMediumWeight,
// ),
// ),
// const Text(' - Sentence 1'),
// const Text(' - Sentence 2')
// ],
// ),
// );
