import 'package:flutter/material.dart';

import '../../../../../../base/define/styles.dart';
import '../../domain/entities/topic_detail_entity.dart';

class PhraseCard extends StatelessWidget {
  const PhraseCard({
    Key? key,
    required this.phraseEntity,
  }) : super(key: key);

  final TopicPhraseEntity phraseEntity;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColor.white,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow.shade200,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: const Offset(0, 2),
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              phraseEntity.topicPhrase ?? 'null phrase',
              style: const TextStyle(
                height: 0.9,
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
                color: AppColor.mainColor1,
              ),
            ),
            Text(
              phraseEntity.phrasePhonetic ?? 'no phonetic',
              style: const TextStyle(
                fontFamily: 'NotoSans',
                fontSize: bodySmallSize * 0.6,
                fontWeight: bodySmallWeight,
                color: AppColor.defaultFont,
              ),
            ),
            const SizedBox(height: spacing4),
            ...phraseEntity.phraseTranslations!.map(
              (e) => Text(
                e.phraseMeaning ?? 'null meaning',
                style: const TextStyle(
                  height: 0.9,
                  fontSize: titleMediumSize,
                  fontWeight: titleMediumWeight,
                ),
              ),
            ),
            const SizedBox(height: spacing2),
            ...phraseEntity.phraseExamples!.map(
              (e) => Text(
                e.phraseExample ?? 'null example',
                style: const TextStyle(
                  height: 0.9,
                  fontSize: bodyMediumSize,
                  fontWeight: bodyMediumWeight,
                ),
              ),
            ),
          ],
        ),
      );
}
