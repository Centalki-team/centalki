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
      topicId: json['topicId'] as String?,
    );

Map<String, dynamic> _$TopicQuestionModelToJson(TopicQuestionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'topicId': instance.topicId,
    };

TopicPhraseModel _$TopicPhraseModelFromJson(Map<String, dynamic> json) =>
    TopicPhraseModel(
      id: json['id'] as String?,
      topicId: json['topicId'] as String?,
      examples: (json['examples'] as List<dynamic>?)
          ?.map((e) => PhraseExampleModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      phonetic: json['phonetic'] as String?,
      meanings: (json['meanings'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      phrase: json['phrase'] as String?,
      updatedAt: json['updatedAt'] as String?,
      createdAt: json['createdAt'] as String?,
    );

Map<String, dynamic> _$TopicPhraseModelToJson(TopicPhraseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topicId': instance.topicId,
      'examples': instance.examples,
      'phonetic': instance.phonetic,
      'meanings': instance.meanings,
      'phrase': instance.phrase,
      'updatedAt': instance.updatedAt,
      'createdAt': instance.createdAt,
    };

PhraseExampleModel _$PhraseExampleModelFromJson(Map<String, dynamic> json) =>
    PhraseExampleModel(
      permalink: json['permalink'] as String?,
      currentVote: json['currentVote'] as String?,
      example: json['example'] as String?,
      author: json['author'] as String?,
      word: json['word'] as String?,
      thumbsUp: json['thumbsUp'] as int?,
      defid: json['defid'] as int?,
      thumbsDown: json['thumbsDown'] as int?,
      writtenOn: json['writtenOn'] as String?,
      definition: json['definition'] as String?,
    );

Map<String, dynamic> _$PhraseExampleModelToJson(PhraseExampleModel instance) =>
    <String, dynamic>{
      'permalink': instance.permalink,
      'currentVote': instance.currentVote,
      'example': instance.example,
      'author': instance.author,
      'word': instance.word,
      'thumbsUp': instance.thumbsUp,
      'defid': instance.defid,
      'thumbsDown': instance.thumbsDown,
      'writtenOn': instance.writtenOn,
      'definition': instance.definition,
    };
