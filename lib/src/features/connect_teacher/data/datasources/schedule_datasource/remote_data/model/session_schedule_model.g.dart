// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionScheduleModel _$SessionScheduleModelFromJson(
        Map<String, dynamic> json) =>
    SessionScheduleModel(
      id: json['id'] as String?,
      studentId: json['studentId'] as String?,
      topic: json['topic'] == null
          ? null
          : TopicDetailModel.fromJson(json['topic'] as Map<String, dynamic>),
      teacherId: json['teacherId'] as String?,
      startAt: json['startAt'] as String?,
      pickedUpAt: json['pickedUpAt'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$SessionScheduleModelToJson(
        SessionScheduleModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'studentId': instance.studentId,
      'topic': instance.topic,
      'teacherId': instance.teacherId,
      'startAt': instance.startAt,
      'pickedUpAt': instance.pickedUpAt,
      'status': instance.status,
      'createdAt': instance.createdAt,
    };
