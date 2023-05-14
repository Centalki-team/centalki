import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../domain/entities/topic_feedback_chip_entity.dart';
import 'selectable_feedback_option_chip.dart';

class FeedbackOptionsSelectionGroup extends StatefulWidget {
  const FeedbackOptionsSelectionGroup({
    super.key,
    required this.title,
    required this.topicFeedbackOptions,
    this.selectedFeedbackOptions,
    this.onAdjustFeedbackOptions,
  });

  final String title;
  final List<TopicFeedbackChipEntity> topicFeedbackOptions;
  final List<TopicFeedbackChipEntity>? selectedFeedbackOptions;
  final Function(List<TopicFeedbackChipEntity>)? onAdjustFeedbackOptions;

  @override
  State<FeedbackOptionsSelectionGroup> createState() =>
      _FeedbackOptionsSelectionGroupState();
}

class _FeedbackOptionsSelectionGroupState
    extends State<FeedbackOptionsSelectionGroup> {
  late List<TopicFeedbackChipEntity> selectionList;

  @override
  void initState() {
    selectionList =
        widget.selectedFeedbackOptions ?? <TopicFeedbackChipEntity>[];
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: titleMediumSize,
              fontWeight: titleMediumWeight,
              color: AppColor.defaultFont,
            ),
          ),
          const SizedBox(
            height: spacing8,
          ),
          Wrap(
            runSpacing: spacing8,
            spacing: spacing8,
            children: widget.topicFeedbackOptions.map((e) {
              var isSelected = selectionList.contains(e);
              return FilterChip(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(24.0),
                  ),
                ),
                label: Text(e.title),
                labelStyle: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.defaultFont,
                ),
                checkmarkColor: AppColor.defaultFont,
                selectedColor: AppColor.mainColor2Surface,
                selected: isSelected,
                onSelected: (_) {
                  setState(() {
                    if (isSelected) {
                      selectionList = List.from(selectionList)..remove(e);
                    } else {
                      selectionList = List.from(selectionList)..add(e);
                    }
                  });
                  widget.onAdjustFeedbackOptions?.call(selectionList);
                },
              );
            }).toList(),
          ),
        ],
      );
}
