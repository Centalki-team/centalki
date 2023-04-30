import 'package:json_annotation/json_annotation.dart';

part 'send_topic_suggestion_params.g.dart';

@JsonSerializable(createFactory: false)
class SendTopicSuggestionParams {
  const SendTopicSuggestionParams(
      {required this.subject, this.description, this.difficulty});

  final String subject;
  final String? description;
  final String? difficulty;

  Map<String, dynamic> toJson() => _$SendTopicSuggestionParamsToJson(this);
}
