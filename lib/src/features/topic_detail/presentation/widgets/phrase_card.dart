import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../domain/entities/topic_detail_entity.dart';

class PhraseCard extends StatelessWidget {
  const PhraseCard({
    Key? key,
    required this.phraseEntity,
  }) : super(key: key);

  final TopicPhraseEntity phraseEntity;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              phraseEntity.topicPhrase ?? 'null phrase',
              style: const TextStyle(
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
                color: AppColor.mainColor1,
              ),
            ),
            const SizedBox(height: smallSpacing1),
            Text(
              phraseEntity.phrasePhonetic ?? 'no phonetic',
              style: const TextStyle(
                fontSize: titleSmallSize,
                fontWeight: titleSmallWeight,
                color: AppColor.defaultFont,
              ),
            ),
            const SizedBox(height: smallSpacing8),
            ...phraseEntity.phraseTranslations!.map(
              (e) => Text(
                e.phraseMeaning ?? 'null meaning',
                style: const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
            ),
            const SizedBox(height: smallSpacing4),
            const Text(
              TextDoc.txtTopicPhraseExample,
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
