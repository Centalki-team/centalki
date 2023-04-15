// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_phrase_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkVocabsItemModel _$BookmarkVocabsItemModelFromJson(
        Map<String, dynamic> json) =>
    BookmarkVocabsItemModel(
      id: json['id'] as String?,
      createdAt:
          AppDateTimeHelper.stringToTime3Nullable(json['createdAt'] as String?),
      phraseId: json['phraseId'] as String?,
      userId: json['userId'] as String?,
      phrase: json['phrase'] == null
          ? null
          : PhraseItemModel.fromJson(json['phrase'] as Map<String, dynamic>),
    );

PhraseItemModel _$PhraseItemModelFromJson(Map<String, dynamic> json) =>
    PhraseItemModel(
      id: json['id'] as String?,
      createdAt:
          AppDateTimeHelper.stringToTime3Nullable(json['createdAt'] as String?),
      topicId: json['topicId'] as String?,
      phrase: json['phrase'] as String?,
      phonetic: json['phonetic'] as String?,
      updatedAt:
          AppDateTimeHelper.stringToTime3Nullable(json['updatedAt'] as String?),
      examples: (json['examples'] as List<dynamic>?)
              ?.map((e) =>
                  PhraseItemExampleModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      translations: (json['translations'] as List<dynamic>?)
              ?.map((e) => PhraseItemTranslationModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

PhraseItemExampleModel _$PhraseItemExampleModelFromJson(
        Map<String, dynamic> json) =>
    PhraseItemExampleModel(
      sentence: json['sentence'] as String?,
    );

PhraseItemTranslationModel _$PhraseItemTranslationModelFromJson(
        Map<String, dynamic> json) =>
    PhraseItemTranslationModel(
      meaning: json['meaning'] as String?,
    );
