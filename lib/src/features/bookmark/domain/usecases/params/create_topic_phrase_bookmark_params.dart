import 'package:json_annotation/json_annotation.dart';

part 'create_topic_phrase_bookmark_params.g.dart';

@JsonSerializable(createFactory: false)
class CreateTopicPhraseBookmarkParams {
  const CreateTopicPhraseBookmarkParams({
    required this.phraseId,
  });

  final String phraseId;

  Map<String, dynamic> toJson() =>
      _$CreateTopicPhraseBookmarkParamsToJson(this);
}
