import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/session_feedback_content_entity.dart';

part 'session_feedback_content_model.g.dart';

@JsonSerializable()
class SessionFeedbackContentBaseModel extends SessionFeedbackContentBaseEntity {
  const SessionFeedbackContentBaseModel({
    required this.data,
  }) : super(
          contents: data,
        );

  final SessionFeedbackContentModel data;

  factory SessionFeedbackContentBaseModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFeedbackContentBaseModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SessionFeedbackContentBaseModelToJson(this);
}

@JsonSerializable()
class SessionFeedbackContentModel extends SessionFeedbackContentEntity {
  SessionFeedbackContentModel({
    this.positive,
    this.negative,
  }) : super(
          positiveContents: positive,
          negativeContents: negative,
        );

  final List<SessionFeedbackContentItemModel>? positive;
  final List<SessionFeedbackContentItemModel>? negative;

  factory SessionFeedbackContentModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFeedbackContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionFeedbackContentModelToJson(this);
}

@JsonSerializable()
class SessionFeedbackContentItemModel extends SessionFeedbackContentItemEntity {
  const SessionFeedbackContentItemModel({
    this.title,
    this.key,
  }) : super(
          contentTitle: title,
          contentKey: key,
        );

  final String? title;
  final String? key;

  factory SessionFeedbackContentItemModel.fromJson(Map<String, dynamic> json) =>
      _$SessionFeedbackContentItemModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SessionFeedbackContentItemModelToJson(this);
}
