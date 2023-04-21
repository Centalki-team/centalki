// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_give_feedback_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionGiveFeedbackModel _$SessionGiveFeedbackModelFromJson(
        Map<String, dynamic> json) =>
    SessionGiveFeedbackModel(
      sessionId: json['sessionId'] as String,
      rating: (json['rating'] as num).toDouble(),
      satisfiedWith: (json['satisfiedWith'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      notSatisfiedWith: (json['notSatisfiedWith'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String?,
      notSatisfiedDetail: json['notSatisfiedDetail'] as String?,
      suggestForTeacher: json['suggestForTeacher'] as String?,
    );

Map<String, dynamic> _$SessionGiveFeedbackModelToJson(
        SessionGiveFeedbackModel instance) =>
    <String, dynamic>{
      'sessionId': instance.sessionId,
      'rating': instance.rating,
      'satisfiedWith': instance.satisfiedWith,
      'notSatisfiedWith': instance.notSatisfiedWith,
      'description': instance.description,
      'notSatisfiedDetail': instance.notSatisfiedDetail,
      'suggestForTeacher': instance.suggestForTeacher,
    };
