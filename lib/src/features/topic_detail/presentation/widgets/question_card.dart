import 'package:flutter/material.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/topic_detail_entity.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.index,
    required this.questionContent,
    required this.answers,
  }) : super(key: key);

  final int index;
  final String questionContent;
  final List<QuestionAnswerEntity> answers;

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: colorsByTheme(context).backgroundCardsChip,
          borderRadius: BorderRadius.circular(radius12),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow.shade200,
              blurRadius: 4.0,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: ExpansionTile(
          collapsedBackgroundColor: colorsByTheme(context).backgroundCardsChip,
          backgroundColor: colorsByTheme(context).backgroundCardsChip,
          iconColor: colorsByTheme(context).expansionIcon,
          collapsedIconColor: colorsByTheme(context).expansionIcon,
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          childrenPadding:
              const EdgeInsets.fromLTRB(padding16, 0, padding8, padding16),
          tilePadding:
              const EdgeInsets.fromLTRB(padding16, padding8, padding8, 0),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${index + 1}.',
                style: TextStyle(
                  height: 1.0,
                  fontSize: titleSmallSize,
                  fontWeight: titleSmallWeight,
                  color: colorsByTheme(context).defaultFont,
                ),
              ),
              const SizedBox(width: spacing8),
              Expanded(
                child: Text(
                  questionContent,
                  style: TextStyle(
                    height: 1.0,
                    fontSize: titleSmallSize,
                    fontWeight: titleSmallWeight,
                    color: colorsByTheme(context).defaultFont,
                  ),
                ),
              ),
            ],
          ),
          children: [
            Text(
              S.current.txtTopicAnswers,
              style: const TextStyle(
                height: 0.9,
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
              ),
            ),
            const SizedBox(height: spacing2),
            ...answers.map(
              (e) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '•',
                    style: TextStyle(
                      height: 0.6,
                      fontSize: headlineLargeSize,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  const SizedBox(width: spacing8),
                  Expanded(
                    child: Text(
                      e.questionAnswer ?? 'null answer',
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
      );
}
