import 'package:json_annotation/json_annotation.dart';

part 'create_session_feedback_params.g.dart';

@JsonSerializable(createFactory: false)
class CreateSessionFeedbackParams {
  const CreateSessionFeedbackParams({
    required this.sessionId,
    required this.rating,
    required this.satisfiedWith,
    required this.notSatisfiedWith,
    this.description,
    this.notSatisfiedDetail,
    this.suggestForTeacher,
  });

  final String sessionId;
  final double rating;
  final List<String> satisfiedWith;
  final List<String> notSatisfiedWith;
  final String? description;
  final String? notSatisfiedDetail;
  final String? suggestForTeacher;

  Map<String, dynamic> toJson() => _$CreateSessionFeedbackParamsToJson(this);
}
