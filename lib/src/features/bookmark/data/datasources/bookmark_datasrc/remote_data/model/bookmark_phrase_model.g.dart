// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_phrase_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkPhraseModel _$BookmarkPhraseModelFromJson(Map<String, dynamic> json) =>
    BookmarkPhraseModel(
      id: json['id'] as String?,
      phraseId: json['phraseId'] as String?,
      userId: json['userId'] as String?,
      createdAt:
          DateTimeHelper.stringToTime3Nullable(json['createdAt'] as String?),
    );
