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
        padding: const EdgeInsets.symmetric(horizontal: 8),
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
            Text(
              phraseEntity.phrasePhonetic ?? 'no phonetic',
              style: const TextStyle(
                fontFamily: 'NotoSans',
                fontSize: bodySmallSize * 0.7,
                fontWeight: bodySmallWeight,
                color: AppColor.defaultFont,
              ),
            ),
            const SizedBox(height: smallSpacing4),
            ...phraseEntity.phraseTranslations!.map(
              (e) => Text(
                e.phraseMeaning ?? 'null meaning',
                style: const TextStyle(
                  fontSize: titleMediumSize,
                  fontWeight: titleMediumWeight,
                ),
              ),
            ),
            ...phraseEntity.phraseExamples!.map(
              (e) => Text(
                e.phraseExample ?? 'null example',
                style: const TextStyle(
                  fontSize: bodyMediumSize,
                  fontWeight: bodyMediumWeight,
                ),
              ),
            ),
          ],
        ),
      );
}
