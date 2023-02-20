import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../../base/helpers/time_helper.dart';
import '../../../../../../topic_detail/data/datasources/topics_datasource/remote_data/model/topic_detail_model.dart';
import '../../../../../domain/entities/session_schedule_entity.dart';

part 'session_schedule_model.g.dart';

@JsonSerializable(createToJson: false)
class SessionScheduleListModel extends SessionScheduleListEntity {
  const SessionScheduleListModel({
    this.data,
  }) : super(sessions: data);

  @JsonKey(defaultValue: [])
  final List<SessionScheduleModel>? data;

  factory SessionScheduleListModel.fromJson(Map<String, dynamic> json) =>
      _$SessionScheduleListModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionScheduleModel extends SessionScheduleEntity {
  SessionScheduleModel({
    this.id,
    this.studentId,
    this.student,
    this.topicId,
    this.topic,
    this.teacherId,
    this.teacher,
    this.startAt,
    this.pickedUpAt,
    this.status,
    this.createdAt,
  }) : super(
          sessionId: id,
          sessionTopic: topic,
          sessionStudent: student,
          sessionTeacher: teacher,
          sessionStatus: status,
          sessionStartAt: startAt,
        );

  final String? id;
  final String? studentId;
  final SessionScheduleUserModel? student;
  final String? topicId;
  final TopicDetailModel? topic;
  final String? teacherId;
  final SessionScheduleUserModel? teacher;
  @JsonKey(name: 'startAt', fromJson: DateTimeHelper.stringToTime3Nullable)
  final DateTime? startAt;
  @JsonKey(name: 'pickedUpAt', fromJson: DateTimeHelper.stringToTime3Nullable)
  final DateTime? pickedUpAt;
  final SessionScheduleStatus? status;
  @JsonKey(name: 'createdAt', fromJson: DateTimeHelper.stringToTime3Nullable)
  final DateTime? createdAt;

  factory SessionScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$SessionScheduleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionScheduleUserModel extends SessionScheduleUserEntity {
  const SessionScheduleUserModel({
    this.tokensValidAfterTime,
    this.providerData,
    this.emailVerified,
    this.disabled,
    this.email,
    this.displayName,
    this.metadata,
    this.uid,
  }) : super(
          fullName: displayName,
        );

  final String? tokensValidAfterTime;
  final List<ProviderDataModel>? providerData;
  final bool? emailVerified;
  final bool? disabled;
  final String? email;
  final String? displayName;
  final MetadataModel? metadata;
  final String? uid;

  factory SessionScheduleUserModel.fromJson(Map<String, dynamic> json) =>
      _$SessionScheduleUserModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class ProviderDataModel {
  const ProviderDataModel({
    this.uid,
    this.email,
    this.displayName,
    this.providerId,
  });

  final String? uid;
  final String? email;
  final String? displayName;
  final String? providerId;

  factory ProviderDataModel.fromJson(Map<String, dynamic> json) =>
      _$ProviderDataModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class MetadataModel {
  const MetadataModel({
    this.lastRefreshTime,
    this.lastSignInTime,
    this.creationTime,
  });

  final String? lastRefreshTime;
  final String? lastSignInTime;
  final String? creationTime;

  factory MetadataModel.fromJson(Map<String, dynamic> json) =>
      _$MetadataModelFromJson(json);
}
