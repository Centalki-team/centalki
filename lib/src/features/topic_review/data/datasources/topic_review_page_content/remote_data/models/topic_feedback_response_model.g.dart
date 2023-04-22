// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_feedback_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicFeedbackResponseModel _$TopicFeedbackResponseModelFromJson(
        Map<String, dynamic> json) =>
    TopicFeedbackResponseModel(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      topicId: json['topicId'] as String?,
      topicNameSummary: (json['topicNameSummary'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      topicNameDetail: json['topicNameDetail'] as String?,
      topicPhotoSummary: (json['topicPhotoSummary'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      topicPhotoDetail: json['topicPhotoDetail'] as String?,
      topicDescriptionSummary:
          (json['topicDescriptionSummary'] as List<dynamic>?)
                  ?.map((e) => e as String)
                  .toList() ??
              const [],
      topicDescriptionDetail: json['topicDescriptionDetail'] as String?,
      topicVocabSummary: (json['topicVocabSummary'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      topicVocabDetail: json['topicVocabDetail'] as String?,
      topicQuestionSummary: (json['topicQuestionSummary'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      topicQuestionDetail: json['topicQuestionDetail'] as String?,
    );
