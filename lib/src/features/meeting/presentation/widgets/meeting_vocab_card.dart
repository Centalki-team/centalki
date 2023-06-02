import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../topic_detail/domain/entities/topic_detail_entity.dart';

class MeetingVocabCard extends StatelessWidget {
  const MeetingVocabCard({
    super.key,
    required this.phraseEntity,
  });

  final TopicPhraseEntity phraseEntity;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundCardsChip,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.shade200,
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: const Offset(1, 2),
              )
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: ExpansionTile(
            collapsedBackgroundColor:
                colorsByTheme(context).backgroundCardsChip,
            backgroundColor: colorsByTheme(context).backgroundCardsChip,
            iconColor: colorsByTheme(context).expansionIcon,
            collapsedIconColor: colorsByTheme(context).expansionIcon,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: const EdgeInsets.only(
              left: padding32,
              right: padding16,
              bottom: padding12,
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                top: padding4,
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
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: bodySmallSize * 0.6,
                      fontWeight: bodySmallWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  const SizedBox(height: spacing4),
                  ...phraseEntity.phraseTranslations!.map(
                    (e) => Text(
                      e.phraseMeaning ?? 'null meaning',
                      style: TextStyle(
                        height: 0.9,
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: colorsByTheme(context).defaultFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            children: [
              const SizedBox(height: spacing2),
              ...phraseEntity.phraseExamples!.map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "• ",
                      style: TextStyle(
                        height: 0.9,
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                      ),
                    ),
                    Expanded(
                      child: Text(
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
              ),
            ],
          ),
        ),
      );
}
