import 'package:json_annotation/json_annotation.dart';

part 'delete_bookmark_topic_params.g.dart';

@JsonSerializable(createFactory: false)
class DeleteBookmarkTopicParams {
  const DeleteBookmarkTopicParams({
    required this.id,
  });

  final String id;

  Map<String, dynamic> toJson() => _$DeleteBookmarkTopicParamsToJson(this);
}
