import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/topic_feedback_response_entity.dart';

part 'topic_feedback_response_model.g.dart';

@JsonSerializable(createToJson: false)
class TopicFeedbackResponseModel extends TopicFeedbackResponseEntity {
  const TopicFeedbackResponseModel({
    String? id,
    String? userId,
    String? topicId,
    List<String> topicNameSummary = const [],
    String? topicNameDetail,
    List<String> topicPhotoSummary = const [],
    String? topicPhotoDetail,
    List<String> topicDescriptionSummary = const [],
    String? topicDescriptionDetail,
    List<String> topicVocabSummary = const [],
    String? topicVocabDetail,
    List<String> topicQuestionSummary = const [],
    String? topicQuestionDetail,
  }) : super(
          id: id ?? '',
          userId: userId ?? '',
          topicId: topicId ?? '',
          topicNameDetail: topicNameDetail ?? '',
          topicPhotoDetail: topicPhotoDetail ?? '',
          topicDescriptionDetail: topicDescriptionDetail ?? '',
          topicVocabDetail: topicVocabDetail ?? '',
          topicQuestionDetail: topicQuestionDetail ?? '',
          topicNameSummary: topicNameSummary,
          topicPhotoSummary: topicPhotoSummary,
          topicDescriptionSummary: topicDescriptionSummary,
          topicVocabSummary: topicVocabSummary,
          topicQuestionSummary: topicQuestionSummary,
        );

  factory TopicFeedbackResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TopicFeedbackResponseModelFromJson(json);
}
