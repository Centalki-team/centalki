import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/topic_detail_entity.dart';

part 'topic_detail_model.g.dart';

@JsonSerializable()
class TopicDetailModel extends TopicDetailEntity {
  TopicDetailModel({
    this.id,
    this.levelId,
    this.categoryId,
    this.name,
    this.imageURL,
    this.description,
    this.level,
    this.category,
    this.questions,
    this.phrases,
  }) : super(
          topicId: id,
          topicName: name,
          topicImage: imageURL,
          topicDescription: description,
          topicLevel: level?.name,
          topicCategory: category?.name,
          topicQuestions: questions,
          topicPhrases: phrases,
        );

  final String? id;
  final String? levelId;
  final String? categoryId;
  final String? name;
  final String? imageURL;
  final String? description;
  final TopicDetailModel? level;
  final TopicCategoryModel? category;
  final List<TopicQuestionModel>? questions;
  final List<TopicPhraseModel>? phrases;

  factory TopicDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TopicDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicDetailModelToJson(this);
}

@JsonSerializable()
class TopicLevelModel {
  const TopicLevelModel({
    this.id,
    this.name,
    this.code,
  });

  final String? id;
  final String? name;
  final String? code;

  factory TopicLevelModel.fromJson(Map<String, dynamic> json) =>
      _$TopicLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicLevelModelToJson(this);
}

@JsonSerializable()
class TopicCategoryModel {
  const TopicCategoryModel(this.id, this.name);

  final String? id;
  final String? name;

  factory TopicCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$TopicCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicCategoryModelToJson(this);
}

@JsonSerializable()
class TopicQuestionModel extends TopicQuestionEntity {
  const TopicQuestionModel({
    this.id,
    this.question,
    this.topicId,
  }) : super(questionContent: question);

  final String? id;
  final String? question;
  final String? topicId;

  factory TopicQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$TopicQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicQuestionModelToJson(this);
}

@JsonSerializable()
class TopicPhraseModel extends TopicPhraseEntity {
  const TopicPhraseModel({
    this.id,
    this.topicId,
    this.examples,
    this.phonetic,
    this.translations,
    this.phrase,
    this.updatedAt,
    this.createdAt,
  }) : super(
          topicPhrase: phrase,
          phrasePhonetic: phonetic,
          phraseTranslations: translations,
          phraseExamples: examples,
        );

  final String? id;
  final String? topicId;
  final List<PhraseExampleModel>? examples;
  final String? phonetic;
  final List<PhraseTranslationModel>? translations;
  final String? phrase;
  final String? updatedAt;
  final String? createdAt;

  factory TopicPhraseModel.fromJson(Map<String, dynamic> json) =>
      _$TopicPhraseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicPhraseModelToJson(this);
}

@JsonSerializable()
class PhraseExampleModel extends PhraseExampleEntity {
  PhraseExampleModel({
    this.sentence,
  }) : super(phraseExample: sentence);

  final String? sentence;

  factory PhraseExampleModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseExampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhraseExampleModelToJson(this);
}

@JsonSerializable()
class PhraseTranslationModel extends PhraseTranslationEntity {
  PhraseTranslationModel({
    this.meaning,
  }) : super(phraseMeaning: meaning);

  final String? meaning;

  factory PhraseTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseTranslationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhraseTranslationModelToJson(this);
}
