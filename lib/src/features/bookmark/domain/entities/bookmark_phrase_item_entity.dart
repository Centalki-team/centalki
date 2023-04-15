import 'package:equatable/equatable.dart';

class BookmarkVocabsItemEntity extends Equatable {
  const BookmarkVocabsItemEntity({
    this.id,
    this.createdAtTime,
    this.phraseId,
    this.userId,
    this.phrase,
  });

  final String? id;
  final DateTime? createdAtTime;
  final String? phraseId;
  final String? userId;
  final PhraseItemEntity? phrase;

  @override
  List<Object?> get props => [
        id,
        createdAtTime,
        phraseId,
        userId,
        phrase,
      ];
}

class PhraseItemEntity extends Equatable {
  const PhraseItemEntity({
    this.id,
    this.createdAtTime,
    this.topicId,
    this.phrase,
    this.examples = const [],
    this.translations = const [],
    this.phonetic,
    this.updatedAtTime,
  });

  final String? id;
  final DateTime? createdAtTime;
  final String? topicId;
  final String? phrase;
  final List<PhraseItemExampleEntity> examples;
  final List<PhraseItemTranslationEntity> translations;
  final String? phonetic;
  final DateTime? updatedAtTime;

  @override
  List<Object?> get props => [
        id,
        createdAtTime,
        topicId,
        phrase,
        examples,
        translations,
        phonetic,
        updatedAtTime,
      ];
}

class PhraseItemExampleEntity extends Equatable {
  const PhraseItemExampleEntity({
    this.sentence,
  });

  final String? sentence;

  @override
  List<Object?> get props => [
        sentence,
      ];
}

class PhraseItemTranslationEntity extends Equatable {
  const PhraseItemTranslationEntity({
    this.meaning,
  });

  final String? meaning;

  @override
  List<Object?> get props => [
        meaning,
      ];
}
