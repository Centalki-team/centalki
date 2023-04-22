// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_feedback_options_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicFeedbackOptionsModel _$TopicFeedbackOptionsModelFromJson(
        Map<String, dynamic> json) =>
    TopicFeedbackOptionsModel(
      topicName: (json['topicName'] as List<dynamic>?)
              ?.map((e) =>
                  TopicFeedbackChipModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topicPhoto: (json['topicPhoto'] as List<dynamic>?)
              ?.map((e) =>
                  TopicFeedbackChipModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topicDescription: (json['topicDescription'] as List<dynamic>?)
              ?.map((e) =>
                  TopicFeedbackChipModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topicQuestions: (json['topicQuestions'] as List<dynamic>?)
              ?.map((e) =>
                  TopicFeedbackChipModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      topicVocab: (json['topicVocab'] as List<dynamic>?)
              ?.map((e) =>
                  TopicFeedbackChipModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );
