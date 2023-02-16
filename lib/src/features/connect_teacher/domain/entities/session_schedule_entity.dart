import 'package:json_annotation/json_annotation.dart';

enum SessionScheduleStatus {
  @JsonValue('ROUTING')
  routing,
  @JsonValue('PICKED_UP')
  pickedUp,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('TIME_OUT')
  timeOut,
}

class SessionScheduleEntity {
  const SessionScheduleEntity({
    this.sessionId,
    this.sessionTopicId,
    this.sessionStudentId,
    this.sessionTeacherId,
    this.sessionTeacher,
    this.sessionStatus,
  });

  final String? sessionId;
  final String? sessionTopicId;
  final String? sessionStudentId;
  final String? sessionTeacherId;
  final SessionScheduleUserEntity? sessionTeacher;
  final SessionScheduleStatus? sessionStatus;
}

class SessionScheduleUserEntity {
  const SessionScheduleUserEntity({
    this.fullName,
  });

  final String? fullName;
}
