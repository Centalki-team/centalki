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
    required this.sessionId,
    this.sessionTopic,
    this.sessionStudent,
    this.sessionTeacher,
    this.sessionStatus,
    this.sessionStartAt,
    this.sessionFeedback,
  });

  final String sessionId;
  final TopicDetailModel? sessionTopic;
  final SessionScheduleUserEntity? sessionStudent;
  final SessionScheduleUserEntity? sessionTeacher;
  final SessionScheduleStatus? sessionStatus;
  final DateTime? sessionStartAt;
  final SessionFeedbackEntity? sessionFeedback;
}

class SessionScheduleUserEntity {
  const SessionScheduleUserEntity({
    this.fullName,
    this.id,
  });

  final String? fullName;
  final String? id;
}

class SessionFeedbackEntity {
  const SessionFeedbackEntity({this.feedbackTeacher, this.feedbackStudent});

  final SessionFeedbackTeacherEntity? feedbackTeacher;
  final SessionFeedbackStudentEntity? feedbackStudent;
}

class SessionFeedbackTeacherEntity {
  const SessionFeedbackTeacherEntity({
    required this.id,
    required this.sessionRating,
    required this.summarySatisfied,
    required this.summaryNotSatisfied,
    this.satisfiedDescription,
    this.notSatisfiedDescription,
    this.suggestions,
  });

  final String id;
  final double sessionRating;
  final List<String> summarySatisfied;
  final List<String> summaryNotSatisfied;
  final String? satisfiedDescription;
  final String? notSatisfiedDescription;
  final String? suggestions;
}

class SessionFeedbackStudentEntity {
  const SessionFeedbackStudentEntity({
    this.feedbackId,
    this.feedbackVocabularies,
    this.feedbackGrammar,
    this.feedbackPronunciation,
    this.feedbackIdea,
    this.feedbackFluency,
    this.feedbackDescription,
    this.feedbackSessionId,
    this.suggestions,
  });

  final String? feedbackId;
  final double? feedbackVocabularies;
  final double? feedbackGrammar;
  final double? feedbackPronunciation;
  final double? feedbackIdea;
  final double? feedbackFluency;
  final String? feedbackDescription;
  final String? feedbackSessionId;
  final String? suggestions;
}
