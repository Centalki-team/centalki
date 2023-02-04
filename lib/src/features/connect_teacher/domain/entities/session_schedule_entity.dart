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
  ROUTING,
  PICKED_UP,
  COMPLETED,
  CANCELLED,
  TIME_OUT,
}
