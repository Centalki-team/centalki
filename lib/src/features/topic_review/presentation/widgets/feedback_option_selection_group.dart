import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../domain/entities/topic_feedback_chip_entity.dart';

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
            style: TextStyle(
              fontSize: titleMediumSize,
              fontWeight: titleMediumWeight,
              color: colorsByTheme(context).defaultFont,
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
                backgroundColor: colorsByTheme(context).selectableChipBg,
                // shape: const RoundedRectangleBorder(
                //   borderRadius: BorderRadius.all(
                //     Radius.circular(24.0),
                //   ),
                // ),
                shape: const StadiumBorder(),
                label: Text(e.title),
                labelStyle: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: isSelected
                      ? AppColor.defaultFontLight
                      : colorsByTheme(context).defaultFont,
                ),
                checkmarkColor: AppColor.defaultFontLight,
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
