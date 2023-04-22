import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/topic_feedback_chip_entity.dart';

part 'topic_feedback_chip_model.g.dart';

@JsonSerializable(createToJson: false)
class TopicFeedbackChipModel extends TopicFeedbackChipEntity {
  const TopicFeedbackChipModel({
    String? key,
    String? title,
  }) : super(
          key: key ?? '',
          title: title ?? '',
        );

  factory TopicFeedbackChipModel.fromJson(Map<String, dynamic> json) =>
      _$TopicFeedbackChipModelFromJson(json);
}
