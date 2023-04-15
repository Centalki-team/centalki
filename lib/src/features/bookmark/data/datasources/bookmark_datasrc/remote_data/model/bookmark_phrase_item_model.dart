import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../shared/utilities/datetime_helper.dart';
import '../../../../../domain/entities/bookmark_phrase_item_entity.dart';

part 'bookmark_phrase_item_model.g.dart';

@JsonSerializable(createToJson: false)
class BookmarkVocabsItemModel extends BookmarkVocabsItemEntity {
  const BookmarkVocabsItemModel({
    String? id,
    this.createdAt,
    String? phraseId,
    String? userId,
    PhraseItemModel? phrase,
  }) : super(
          id: id,
          createdAtTime: createdAt,
          phraseId: phraseId,
          phrase: phrase,
        );

  @JsonKey(fromJson: AppDateTimeHelper.stringToTime3Nullable)
  final DateTime? createdAt;

  factory BookmarkVocabsItemModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkVocabsItemModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PhraseItemModel extends PhraseItemEntity {
  const PhraseItemModel({
    String? id,
    this.createdAt,
    String? topicId,
    String? phrase,
    String? phonetic,
    this.updatedAt,
    List<PhraseItemExampleModel> examples = const [],
    List<PhraseItemTranslationModel> translations = const [],
  }) : super(
          id: id,
          createdAtTime: createdAt,
          topicId: topicId,
          phrase: phrase,
          examples: examples,
          translations: translations,
          phonetic: phonetic,
          updatedAtTime: updatedAt,
        );

  @JsonKey(fromJson: AppDateTimeHelper.stringToTime3Nullable)
  final DateTime? createdAt;
  @JsonKey(fromJson: AppDateTimeHelper.stringToTime3Nullable)
  final DateTime? updatedAt;

  factory PhraseItemModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseItemModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PhraseItemExampleModel extends PhraseItemExampleEntity {
  const PhraseItemExampleModel({String? sentence})
      : super(
          sentence: sentence,
        );

  factory PhraseItemExampleModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseItemExampleModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class PhraseItemTranslationModel extends PhraseItemTranslationEntity {
  const PhraseItemTranslationModel({
    String? meaning,
  }) : super(
          meaning: meaning,
        );

  factory PhraseItemTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseItemTranslationModelFromJson(json);
}
