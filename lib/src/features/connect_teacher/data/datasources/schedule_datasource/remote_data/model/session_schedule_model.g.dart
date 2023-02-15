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
      student: json['student'] == null
          ? null
          : SessionScheduleUserModel.fromJson(
              json['student'] as Map<String, dynamic>),
      topicId: json['topicId'] as String?,
      topic: json['topic'] == null
          ? null
          : TopicDetailModel.fromJson(json['topic'] as Map<String, dynamic>),
      teacherId: json['teacherId'] as String?,
      teacher: json['teacher'] == null
          ? null
          : SessionScheduleUserModel.fromJson(
              json['teacher'] as Map<String, dynamic>),
      startAt: json['startAt'] as String?,
      pickedUpAt: json['pickedUpAt'] as String?,
      status:
          $enumDecodeNullable(_$SessionScheduleStatusEnumMap, json['status']),
      createdAt: json['createdAt'] as String?,
    );

const _$SessionScheduleStatusEnumMap = {
  SessionScheduleStatus.routing: 'ROUTING',
  SessionScheduleStatus.pickedUp: 'PICKED_UP',
  SessionScheduleStatus.completed: 'COMPLETED',
  SessionScheduleStatus.cancelled: 'CANCELLED',
  SessionScheduleStatus.timeOut: 'TIME_OUT',
};

SessionScheduleUserModel _$SessionScheduleUserModelFromJson(
        Map<String, dynamic> json) =>
    SessionScheduleUserModel(
      tokensValidAfterTime: json['tokensValidAfterTime'] as String?,
      providerData: (json['providerData'] as List<dynamic>?)
          ?.map((e) => ProviderDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      emailVerified: json['emailVerified'] as bool?,
      disabled: json['disabled'] as bool?,
      email: json['email'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      uid: json['uid'] as String?,
    );

ProviderDataModel _$ProviderDataModelFromJson(Map<String, dynamic> json) =>
    ProviderDataModel(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      providerId: json['providerId'] as String?,
    );

MetadataModel _$MetadataModelFromJson(Map<String, dynamic> json) =>
    MetadataModel(
      lastRefreshTime: json['lastRefreshTime'] as String?,
      lastSignInTime: json['lastSignInTime'] as String?,
      creationTime: json['creationTime'] as String?,
    );
