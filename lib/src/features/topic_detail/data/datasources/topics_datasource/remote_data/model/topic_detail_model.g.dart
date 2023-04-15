// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicDetailModel _$TopicDetailModelFromJson(Map<String, dynamic> json) =>
    TopicDetailModel(
      id: json['id'] as String?,
      levelId: json['levelId'] as String?,
      categoryId: json['categoryId'] as String?,
      name: json['name'] as String?,
      imageURL: json['imageURL'] as String?,
      description: json['description'] as String?,
      level: json['level'] == null
          ? null
          : TopicDetailModel.fromJson(json['level'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : TopicCategoryModel.fromJson(
              json['category'] as Map<String, dynamic>),
      questions: (json['questions'] as List<dynamic>?)
          ?.map((e) => TopicQuestionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phrases: (json['phrases'] as List<dynamic>?)
          ?.map((e) => TopicPhraseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TopicDetailModelToJson(TopicDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'levelId': instance.levelId,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'imageURL': instance.imageURL,
      'description': instance.description,
      'level': instance.level,
      'category': instance.category,
      'questions': instance.questions,
      'phrases': instance.phrases,
    };

TopicLevelModel _$TopicLevelModelFromJson(Map<String, dynamic> json) =>
    TopicLevelModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
      code: json['code'] as String?,
    );

Map<String, dynamic> _$TopicLevelModelToJson(TopicLevelModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'code': instance.code,
    };

TopicCategoryModel _$TopicCategoryModelFromJson(Map<String, dynamic> json) =>
    TopicCategoryModel(
      json['id'] as String?,
      json['name'] as String?,
    );

Map<String, dynamic> _$TopicCategoryModelToJson(TopicCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

TopicQuestionModel _$TopicQuestionModelFromJson(Map<String, dynamic> json) =>
    TopicQuestionModel(
      id: json['id'] as String?,
      question: json['question'] as String?,
      answers: (json['answers'] as List<dynamic>?)
          ?.map((e) => QuestionAnswerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      topicId: json['topicId'] as String?,
    );

Map<String, dynamic> _$TopicQuestionModelToJson(TopicQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'answers': instance.answers,
      'topicId': instance.topicId,
    };

QuestionAnswerModel _$QuestionAnswerModelFromJson(Map<String, dynamic> json) =>
    QuestionAnswerModel(
      answer: json['answer'] as String?,
    );

Map<String, dynamic> _$QuestionAnswerModelToJson(
        QuestionAnswerModel instance) =>
    <String, dynamic>{
      'answer': instance.answer,
    };

TopicPhraseModel _$TopicPhraseModelFromJson(Map<String, dynamic> json) =>
    TopicPhraseModel(
      id: json['id'] as String?,
      topicId: json['topicId'] as String?,
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => PhraseExampleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phonetic: json['phonetic'] as String?,
      translations: (json['translations'] as List<dynamic>?)
          ?.map(
              (e) => PhraseTranslationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phrase: json['phrase'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      topicPharseBookmark: json['bookmark'] == null
          ? null
          : TopicPhraseBookmarkModel.fromJson(
              json['bookmark'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopicPhraseModelToJson(TopicPhraseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topicId': instance.topicId,
      'examples': instance.examples,
      'phonetic': instance.phonetic,
      'translations': instance.translations,
      'phrase': instance.phrase,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
      'bookmark': instance.topicPharseBookmark,
    };

TopicPhraseBookmarkModel _$TopicPhraseBookmarkModelFromJson(
        Map<String, dynamic> json) =>
    TopicPhraseBookmarkModel(
      id: json['id'] as String?,
      phraseId: json['phraseId'] as String?,
      userId: json['userId'] as String?,
      createdAt:
          DateTimeHelper.stringToTime3Nullable(json['createdAt'] as String?),
    );

Map<String, dynamic> _$TopicPhraseBookmarkModelToJson(
        TopicPhraseBookmarkModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'phraseId': instance.phraseId,
      'userId': instance.userId,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

PhraseExampleModel _$PhraseExampleModelFromJson(Map<String, dynamic> json) =>
    PhraseExampleModel(
      sentence: json['sentence'] as String?,
    );

Map<String, dynamic> _$PhraseExampleModelToJson(PhraseExampleModel instance) =>
    <String, dynamic>{
      'sentence': instance.sentence,
    };

PhraseTranslationModel _$PhraseTranslationModelFromJson(
        Map<String, dynamic> json) =>
    PhraseTranslationModel(
      meaning: json['meaning'] as String?,
    );

Map<String, dynamic> _$PhraseTranslationModelToJson(
        PhraseTranslationModel instance) =>
    <String, dynamic>{
      'meaning': instance.meaning,
    };
