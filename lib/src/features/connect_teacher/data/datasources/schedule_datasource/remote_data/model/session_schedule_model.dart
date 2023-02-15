import 'package:json_annotation/json_annotation.dart';

import '../../../../../../topic_detail/data/datasources/topics_datasource/remote_data/model/topic_detail_model.dart';
import '../../../../../domain/entities/session_schedule_entity.dart';

part 'session_schedule_model.g.dart';

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
          sessionStudentId: studentId,
          sessionTeacherId: teacherId,
          sessionStatus: status,
        );

  final String? id;
  final String? studentId;
  final SessionScheduleUserModel? student;
  final String? topicId;
  final TopicDetailModel? topic;
  final String? teacherId;
  final SessionScheduleUserModel? teacher;
  final String? startAt;
  final String? pickedUpAt;
  final SessionScheduleStatus? status;
  final String? createdAt;

  factory SessionScheduleModel.fromJson(Map<String, dynamic> json) =>
      _$SessionScheduleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionScheduleUserModel {
  const SessionScheduleUserModel({
    this.tokensValidAfterTime,
    this.providerData,
    this.emailVerified,
    this.disabled,
    this.email,
    this.metadata,
    this.uid,
  });

  final String? tokensValidAfterTime;
  final List<ProviderDataModel>? providerData;
  final bool? emailVerified;
  final bool? disabled;
  final String? email;
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
    this.providerId,
  });

  final String? uid;
  final String? email;
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
