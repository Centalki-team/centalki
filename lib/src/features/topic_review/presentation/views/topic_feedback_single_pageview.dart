import 'package:flutter/material.dart';

import '../../../../../base/define/dimensions.dart';
import '../../../../../base/widgets/text_fields/outlined_text_field.dart';
import '../../../../../base/widgets/text_fields/text_field.dart';
import '../../domain/entities/topic_feedback_chip_entity.dart';
import '../widgets/feedback_option_selection_group.dart';

class TopicFeedbackSinglePageView extends StatefulWidget {
  const TopicFeedbackSinglePageView({
    super.key,
    required this.title,
    required this.topicFeedbackOptions,
    required this.selectionList,
    this.hint = '',
    this.maxLength = 500,
    this.maxLines = 4,
    this.onAdjustSelection,
    this.onAdjustDetail,
  });

  final String title;
  final List<TopicFeedbackChipEntity> topicFeedbackOptions;
  final List<TopicFeedbackChipEntity> selectionList;
  final String hint;
  final int maxLines;
  final int maxLength;
  final Function(List<TopicFeedbackChipEntity>)? onAdjustSelection;
  final Function(String)? onAdjustDetail;

  @override
  State<TopicFeedbackSinglePageView> createState() =>
      _TopicFeedbackSinglePageViewState();
}

class _TopicFeedbackSinglePageViewState
    extends State<TopicFeedbackSinglePageView> {
  final _txtController = TextEditingController();

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeedbackOptionsSelectionGroup(
                title: widget.title,
                topicFeedbackOptions: widget.topicFeedbackOptions,
                selectedFeedbackOptions: widget.selectionList,
                onAdjustFeedbackOptions: widget.onAdjustSelection,
              ),
              const SizedBox(
                height: spacing24,
              ),
              AppOutlinedTextField(
                controller: _txtController,
                hintText: widget.hint,
                maxLines: widget.maxLines,
                maxLength: widget.maxLength,
                onChanged: (value) => widget.onAdjustDetail?.call(value),
              )
            ],
          ),
        ),
      );
}
