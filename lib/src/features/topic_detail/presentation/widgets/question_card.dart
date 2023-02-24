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
      color: AppColor.white,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColor.container,
            ),
            alignment: Alignment.center,
            child: Text(
              '${index + 1}',
              style: const TextStyle(
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
                color: AppColor.defaultFontContainer,
              ),
            ),
          ),
          const SizedBox(width: smallSpacing10),
          Expanded(
            child: Text(
              questionContent,
              style: const TextStyle(
                fontSize: titleSmallSize,
                fontWeight: titleSmallWeight,
                color: AppColor.defaultFontContainer,
              ),
            ),
          ),
          const SizedBox(width: smallSpacing8),
        ],
      ),
    );
}
