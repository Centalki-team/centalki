import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';

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
      color: colorScheme.surface,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: colorScheme.primaryContainer,
            ),
            alignment: Alignment.center,
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: smallSpacing10),
          Expanded(
            child: Text(
              questionContent,
              style: TextStyle(
                fontSize: titleSmallSize,
                fontWeight: titleSmallWeight,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
          ),
          const SizedBox(width: smallSpacing8),
        ],
      ),
    );
}
