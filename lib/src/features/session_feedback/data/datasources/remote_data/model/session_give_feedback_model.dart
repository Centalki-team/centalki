import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/session_give_feedback_entity.dart';

part 'session_give_feedback_model.g.dart';

@JsonSerializable()
class SessionGiveFeedbackModel extends SessionGiveFeedbackEntity {
  const SessionGiveFeedbackModel({
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

  factory SessionGiveFeedbackModel.fromJson(Map<String, dynamic> json) =>
      _$SessionGiveFeedbackModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionGiveFeedbackModelToJson(this);
}
