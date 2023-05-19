// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_schedule_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SessionScheduleListModel _$SessionScheduleListModelFromJson(
        Map<String, dynamic> json) =>
    SessionScheduleListModel(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) =>
                  SessionScheduleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

SessionScheduleModel _$SessionScheduleModelFromJson(
        Map<String, dynamic> json) =>
    SessionScheduleModel(
      id: json['id'] as String,
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
      startAt: DateTimeHelper.stringToTime3Nullable(json['startAt'] as String?),
      pickedUpAt:
          DateTimeHelper.stringToTime3Nullable(json['pickedUpAt'] as String?),
      status:
          $enumDecodeNullable(_$SessionScheduleStatusEnumMap, json['status']),
      createdAt:
          DateTimeHelper.stringToTime3Nullable(json['createdAt'] as String?),
      feedback: json['feedback'] == null
          ? null
          : SessionFeedbackModel.fromJson(
              json['feedback'] as Map<String, dynamic>),
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
      displayName: json['displayName'] as String?,
      metadata: json['metadata'] == null
          ? null
          : MetadataModel.fromJson(json['metadata'] as Map<String, dynamic>),
      uid: json['uid'] as String?,
      photoURL: json['photoURL'] as String?,
    );

ProviderDataModel _$ProviderDataModelFromJson(Map<String, dynamic> json) =>
    ProviderDataModel(
      uid: json['uid'] as String?,
      email: json['email'] as String?,
      displayName: json['displayName'] as String?,
      providerId: json['providerId'] as String?,
    );

MetadataModel _$MetadataModelFromJson(Map<String, dynamic> json) =>
    MetadataModel(
      lastRefreshTime: json['lastRefreshTime'] as String?,
      lastSignInTime: json['lastSignInTime'] as String?,
      creationTime: json['creationTime'] as String?,
    );

SessionFeedbackModel _$SessionFeedbackModelFromJson(
        Map<String, dynamic> json) =>
    SessionFeedbackModel(
      teacher: json['teacher'] == null
          ? null
          : SessionFeedbackTeacherModel.fromJson(
              json['teacher'] as Map<String, dynamic>),
      student: json['student'] == null
          ? null
          : SessionFeedbackStudentModel.fromJson(
              json['student'] as Map<String, dynamic>),
    );

SessionFeedbackTeacherModel _$SessionFeedbackTeacherModelFromJson(
        Map<String, dynamic> json) =>
    SessionFeedbackTeacherModel(
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

SessionFeedbackStudentModel _$SessionFeedbackStudentModelFromJson(
        Map<String, dynamic> json) =>
    SessionFeedbackStudentModel(
      id: json['id'] as String?,
      vocabularies: (json['vocabularies'] as num?)?.toDouble(),
      grammar: (json['grammar'] as num?)?.toDouble(),
      pronunciation: (json['pronunciation'] as num?)?.toDouble(),
      idea: (json['idea'] as num?)?.toDouble(),
      fluency: (json['fluency'] as num?)?.toDouble(),
      description: json['description'] as String?,
      sessionId: json['sessionId'] as String?,
      suggest: json['suggest'] as String?,
    );
