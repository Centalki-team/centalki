import 'package:equatable/equatable.dart';

class TopicDetailEntity extends Equatable {
  const TopicDetailEntity({
    this.topicId,
    this.topicName,
    this.topicImage,
    this.topicDescription,
    this.topicLevel,
    this.topicCategory,
    this.topicQuestions,
    this.topicPhrases,
  });

  final String? topicId;
  final String? topicName;
  final String? topicImage;
  final String? topicDescription;
  final String? topicLevel;
  final String? topicCategory;
  final List<TopicQuestionEntity>? topicQuestions;
  final List<TopicPhraseEntity>? topicPhrases;

  @override
  List<Object?> get props => [
        topicId,
        topicName,
        topicImage,
        topicDescription,
        topicLevel,
        topicCategory,
        topicQuestions,
        topicPhrases,
      ];
}

class TopicQuestionEntity extends Equatable {
  const TopicQuestionEntity({this.questionContent, this.topicAnswers});

  final String? questionContent;

  @override
  List<Object?> get props => [
        questionContent,
      ];
  final List<QuestionAnswerEntity>? topicAnswers;
}

class TopicPhraseEntity extends Equatable {
  const TopicPhraseEntity({
    this.topicPhraseId,
    this.topicPhrase,
    this.phrasePhonetic,
    this.phraseTranslations,
    this.phraseExamples,
    this.bookmark,
  });

  final String? topicPhraseId;
  final String? topicPhrase;
  final String? phrasePhonetic;
  final List<PhraseTranslationEntity>? phraseTranslations;
  final List<PhraseExampleEntity>? phraseExamples;
  final TopicPhraseBookmarkEntity? bookmark;

  @override
  List<Object?> get props => [
        topicPhraseId,
        topicPhrase,
        phrasePhonetic,
        phraseTranslations,
        phraseExamples,
        bookmark,
      ];
}

class QuestionAnswerEntity {
  const QuestionAnswerEntity({this.questionAnswer});

  final String? questionAnswer;
}

class PhraseExampleEntity extends Equatable {
  const PhraseExampleEntity({this.phraseExample});

  final String? phraseExample;

  @override
  List<Object?> get props => [
        phraseExample,
      ];
}

class PhraseTranslationEntity extends Equatable {
  const PhraseTranslationEntity({this.phraseMeaning});

  final String? phraseMeaning;

  @override
  List<Object?> get props => [
        phraseMeaning,
      ];
}

class TopicPhraseBookmarkEntity extends Equatable {
  const TopicPhraseBookmarkEntity({
    this.id,
    this.createdAtTime,
    this.phraseId,
    this.userId,
  });

  final String? id;
  final DateTime? createdAtTime;
  final String? phraseId;
  final String? userId;

  @override
  List<Object?> get props => [
        id,
        createdAtTime,
        phraseId,
        userId,
      ];
}
