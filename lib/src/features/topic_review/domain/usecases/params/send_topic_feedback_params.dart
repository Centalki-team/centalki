import 'package:json_annotation/json_annotation.dart';

part 'send_topic_feedback_params.g.dart';

@JsonSerializable(createFactory: false)
class SendTopicFeedbackParams {
  const SendTopicFeedbackParams({
    required this.topicId,
    this.topicNameSummary = const [],
    required this.topicNameDetail,
    this.topicPhotoSummary = const [],
    required this.topicPhotoDetail,
    this.topicDescriptionSummary = const [],
    required this.topicDescriptionDetail,
    this.topicVocabSummary = const [],
    required this.topicVocabDetail,
    this.topicQuestionSummary = const [],
    required this.topicQuestionDetail,
  });

  final String topicId;
  final List<String> topicNameSummary;
  final String topicNameDetail;
  final List<String> topicPhotoSummary;
  final String topicPhotoDetail;
  final List<String> topicDescriptionSummary;
  final String topicDescriptionDetail;
  final List<String> topicVocabSummary;
  final String topicVocabDetail;
  final List<String> topicQuestionSummary;
  final String topicQuestionDetail;

  Map<String, dynamic> toJson() => _$SendTopicFeedbackParamsToJson(this);
}
