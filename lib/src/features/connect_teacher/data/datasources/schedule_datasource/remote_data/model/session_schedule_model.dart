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
    required this.id,
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
    this.feedback,
  }) : super(
          sessionId: id,
          sessionTopic: topic,
          sessionStudent: student,
          sessionTeacher: teacher,
          sessionStatus: status,
          sessionStartAt: startAt,
          sessionFeedback: feedback,
        );

  final String id;
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
  final SessionFeedbackModel? feedback;

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
    this.photoURL,
  }) : super(
          fullName: displayName,
          id: uid,
          avatarURL: photoURL,
        );

  final String? tokensValidAfterTime;
  final List<ProviderDataModel>? providerData;
  final bool? emailVerified;
  final bool? disabled;
  final String? email;
  final String? displayName;
  final MetadataModel? metadata;
  final String? uid;
  final String? photoURL;

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

@JsonSerializable(createToJson: false)
class SessionFeedbackModel extends SessionFeedbackEntity {
  const SessionFeedbackModel({this.teacher, this.student})
      : super(feedbackTeacher: teacher, feedbackStudent: student);

  final SessionFeedbackTeacherModel? teacher;
  final SessionFeedbackStudentModel? student;

  factory SessionFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFeedbackModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionFeedbackTeacherModel extends SessionFeedbackTeacherEntity {
  const SessionFeedbackTeacherModel({
    required this.sessionId,
    required this.rating,
    required this.satisfiedWith,
    required this.notSatisfiedWith,
    this.description,
    this.notSatisfiedDetail,
    this.suggestForTeacher,
  }) : super(
            id: sessionId,
            sessionRating: rating,
            summarySatisfied: satisfiedWith,
            summaryNotSatisfied: notSatisfiedWith,
            satisfiedDescription: description,
            notSatisfiedDescription: notSatisfiedDetail);

  final String sessionId;
  final double rating;
  final List<String> satisfiedWith;
  final List<String> notSatisfiedWith;
  final String? description;
  final String? notSatisfiedDetail;
  final String? suggestForTeacher;

  factory SessionFeedbackTeacherModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFeedbackTeacherModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class SessionFeedbackStudentModel extends SessionFeedbackStudentEntity {
  const SessionFeedbackStudentModel({
    this.id,
    this.vocabularies,
    this.grammar,
    this.pronunciation,
    this.idea,
    this.fluency,
    this.description,
    this.sessionId,
    this.suggest,
  }) : super(
          feedbackId: id,
          feedbackVocabularies: vocabularies,
          feedbackGrammar: grammar,
          feedbackPronunciation: pronunciation,
          feedbackIdea: idea,
          feedbackFluency: fluency,
          feedbackDescription: description,
          feedbackSessionId: sessionId,
          suggestions: suggest,
        );

  final String? id;
  final double? vocabularies;
  final double? grammar;
  final double? pronunciation;
  final double? idea;
  final double? fluency;
  final String? description;
  final String? sessionId;
  final String? suggest;

  factory SessionFeedbackStudentModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFeedbackStudentModelFromJson(json);
}
