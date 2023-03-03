import 'package:flutter/material.dart';

import '../../../../../../base/define/styles.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key? key,
    required this.index,
    required this.questionContent,
  }) : super(key: key);

  final int index;
  final String questionContent;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadow.shade200,
              blurRadius: 4.0,
              spreadRadius: 0,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: spacing8),
            Text(
              '${index + 1}.',
              style: const TextStyle(
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
                color: AppColor.defaultFont,
              ),
            ),
            const SizedBox(width: spacing8),
            Expanded(
              child: Text(
                questionContent,
                style: const TextStyle(
                  fontSize: titleSmallSize,
                  fontWeight: titleSmallWeight,
                  color: AppColor.defaultFont,
                ),
              ),
            ),
            const SizedBox(width: spacing8),
          ],
        ),
      );
}
