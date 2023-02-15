import 'package:json_annotation/json_annotation.dart';

class SessionScheduleEntity {
  const SessionScheduleEntity({
    this.sessionId,
    this.sessionStudentId,
    this.sessionTopicId,
    this.sessionTeacherId,
    this.sessionStatus,
  });

  final String? sessionId;
  final String? sessionStudentId;
  final String? sessionTopicId;
  final String? sessionTeacherId;
  final SessionScheduleStatus? sessionStatus;
}

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