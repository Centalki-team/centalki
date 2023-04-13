import 'package:json_annotation/json_annotation.dart';

part 'create_bookmark_topic_params.g.dart';

@JsonSerializable(createFactory: false)
class CreateBookmarkTopicParams {
  const CreateBookmarkTopicParams({
    required this.topicId,
  });

  final String topicId;

  Map<String, dynamic> toJson() => _$CreateBookmarkTopicParamsToJson(this);
}
