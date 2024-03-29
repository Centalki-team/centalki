import 'package:json_annotation/json_annotation.dart';

import '../../../../../../../../base/helpers/time_helper.dart';
import '../../../../../../bookmark/topic/data/datasources/remote_data/model/bookmark_topic_model.dart';
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
    this.topicBookmark,
  }) : super(
          topicId: id,
          topicName: name,
          topicImage: imageURL,
          topicDescription: description,
          topicLevel: level?.name,
          topicCategory: category?.name,
          topicQuestions: questions,
          topicPhrases: phrases,
          bookmark: topicBookmark,
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
  final BookmarkTopicModel? topicBookmark;

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
    this.answers,
    this.topicId,
  }) : super(questionContent: question, topicAnswers: answers);

  final String? id;
  final String? question;
  final List<QuestionAnswerModel>? answers;
  final String? topicId;

  factory TopicQuestionModel.fromJson(Map<String, dynamic> json) =>
      _$TopicQuestionModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicQuestionModelToJson(this);
}

@JsonSerializable()
class QuestionAnswerModel extends QuestionAnswerEntity {
  QuestionAnswerModel({
    this.answer,
  }) : super(questionAnswer: answer);

  final String? answer;

  factory QuestionAnswerModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionAnswerModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionAnswerModelToJson(this);
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
    this.topicPharseBookmark,
  }) : super(
          topicPhraseId: id,
          topicPhrase: phrase,
          phrasePhonetic: phonetic,
          phraseTranslations: translations,
          phraseExamples: examples,
          bookmark: topicPharseBookmark,
        );

  final String? id;
  final String? topicId;
  final List<PhraseExampleModel>? examples;
  final String? phonetic;
  final List<PhraseTranslationModel>? translations;
  final String? phrase;
  final String? updatedAt;
  final String? createdAt;
  @JsonKey(name: 'bookmark')
  final TopicPhraseBookmarkModel? topicPharseBookmark;

  factory TopicPhraseModel.fromJson(Map<String, dynamic> json) =>
      _$TopicPhraseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicPhraseModelToJson(this);
}

@JsonSerializable()
class TopicPhraseBookmarkModel extends TopicPhraseBookmarkEntity {
  const TopicPhraseBookmarkModel({
    String? id,
    String? phraseId,
    String? userId,
    this.createdAt,
  }) : super(
          id: id,
          phraseId: phraseId,
          userId: userId,
          createdAtTime: createdAt,
        );

  @JsonKey(fromJson: DateTimeHelper.stringToTime3Nullable)
  final DateTime? createdAt;

  factory TopicPhraseBookmarkModel.fromJson(Map<String, dynamic> json) =>
      _$TopicPhraseBookmarkModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicPhraseBookmarkModelToJson(this);
}

@JsonSerializable()
class PhraseExampleModel extends PhraseExampleEntity {
  const PhraseExampleModel({
    this.sentence,
  }) : super(phraseExample: sentence);

  final String? sentence;

  factory PhraseExampleModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseExampleModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhraseExampleModelToJson(this);
}

@JsonSerializable()
class PhraseTranslationModel extends PhraseTranslationEntity {
  const PhraseTranslationModel({
    this.meaning,
  }) : super(phraseMeaning: meaning);

  final String? meaning;

  factory PhraseTranslationModel.fromJson(Map<String, dynamic> json) =>
      _$PhraseTranslationModelFromJson(json);

  Map<String, dynamic> toJson() => _$PhraseTranslationModelToJson(this);
}
