import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/topic_feedback_options_entity.dart';
import 'topic_feedback_chip_model.dart';

part 'topic_feedback_options_model.g.dart';

@JsonSerializable(createToJson: false)
class TopicFeedbackOptionsModel extends TopicFeedbackOptionsEntity {
  const TopicFeedbackOptionsModel({
    List<TopicFeedbackChipModel> topicName = const [],
    List<TopicFeedbackChipModel> topicPhoto = const [],
    List<TopicFeedbackChipModel> topicDescription = const [],
    List<TopicFeedbackChipModel> topicQuestions = const [],
    List<TopicFeedbackChipModel> topicVocab = const [],
  }) : super(
          topicName: topicName,
          topicPhoto: topicPhoto,
          topicDescription: topicDescription,
          topicQuestions: topicQuestions,
          topicVocab: topicVocab,
        );

  factory TopicFeedbackOptionsModel.fromJson(Map<String, dynamic> json) =>
      _$TopicFeedbackOptionsModelFromJson(json);
}
