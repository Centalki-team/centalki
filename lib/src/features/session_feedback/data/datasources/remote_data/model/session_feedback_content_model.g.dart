// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_feedback_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionFeedbackContentBaseModel _$SessionFeedbackContentBaseModelFromJson(
        Map<String, dynamic> json) =>
    SessionFeedbackContentBaseModel(
      data: SessionFeedbackContentModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SessionFeedbackContentBaseModelToJson(
        SessionFeedbackContentBaseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

SessionFeedbackContentModel _$SessionFeedbackContentModelFromJson(
        Map<String, dynamic> json) =>
    SessionFeedbackContentModel(
      positive: (json['positive'] as List<dynamic>?)
          ?.map((e) => SessionFeedbackContentItemModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
      negative: (json['negative'] as List<dynamic>?)
          ?.map((e) => SessionFeedbackContentItemModel.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SessionFeedbackContentModelToJson(
        SessionFeedbackContentModel instance) =>
    <String, dynamic>{
      'positive': instance.positive,
      'negative': instance.negative,
    };

SessionFeedbackContentItemModel _$SessionFeedbackContentItemModelFromJson(
        Map<String, dynamic> json) =>
    SessionFeedbackContentItemModel(
      title: json['title'] as String?,
      key: json['key'] as String?,
    );

Map<String, dynamic> _$SessionFeedbackContentItemModelToJson(
        SessionFeedbackContentItemModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'key': instance.key,
    };
