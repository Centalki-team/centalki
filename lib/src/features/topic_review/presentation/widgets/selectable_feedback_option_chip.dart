import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../domain/entities/topic_feedback_chip_entity.dart';

class SelectableFeedbackOptionChip extends StatelessWidget {
  const SelectableFeedbackOptionChip({
    super.key,
    required this.topicFeedbackChipEntity,
    this.isSelected = false,
  });

  final TopicFeedbackChipEntity topicFeedbackChipEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Container(
        //height: 32.0,
        padding: EdgeInsets.fromLTRB(
          isSelected ? spacing8 : spacing16,
          spacing6,
          spacing16,
          spacing6,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.mainColor2Surface : AppColor.white,
          border: Border.all(
            color: isSelected ? AppColor.mainColor2Surface : AppColor.container,
          ),
          borderRadius: BorderRadius.circular(24.0),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isSelected) ...[
              const Icon(
                Icons.check_rounded,
                color: AppColor.defaultFont,
              ),
              const SizedBox(
                width: spacing8,
              ),
            ],
            Text(
              topicFeedbackChipEntity.title,
              style: isSelected
                  ? const TextStyle(
                      fontSize: labelLargeSize,
                      fontWeight: labelLargeWeight,
                      color: AppColor.defaultFont,
                    )
                  : const TextStyle(
                      fontSize: bodyMediumSize,
                      fontWeight: bodyMediumWeight,
                      color: AppColor.defaultFont,
                    ),
            ),
          ],
        ),
      );
}
