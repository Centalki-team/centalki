import 'package:json_annotation/json_annotation.dart';

import '../../../topic_detail/data/datasources/topics_datasource/remote_data/model/topic_detail_model.dart';

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

class SessionScheduleListEntity {
  const SessionScheduleListEntity({
    this.sessions = const [],
  });

  final List<SessionScheduleEntity>? sessions;
}

class SessionScheduleEntity {
  const SessionScheduleEntity({
    this.sessionId,
    this.sessionTopic,
    this.sessionStudent,
    this.sessionTeacher,
    this.sessionStatus,
  });

  final String? sessionId;
  final TopicDetailModel? sessionTopic;
  final SessionScheduleUserEntity? sessionStudent;
  final SessionScheduleUserEntity? sessionTeacher;
  final SessionScheduleStatus? sessionStatus;
}

class SessionScheduleUserEntity {
  const SessionScheduleUserEntity({
    this.fullName,
  });

  final String? fullName;
}
