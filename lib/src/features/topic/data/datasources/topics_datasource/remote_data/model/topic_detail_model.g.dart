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
          ?.map((e) => TopicPhraseEntity.fromJson(e as Map<String, dynamic>))
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
