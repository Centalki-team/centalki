// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopicItemBaseModel _$TopicItemBaseModelFromJson(Map<String, dynamic> json) =>
    TopicItemBaseModel(
      id: json['id'] as String?,
      categoryId: json['categoryId'] as String?,
      imageUrl: json['imageURL'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      levelId: json['levelId'] as String?,
      category: json['category'] == null
          ? null
          : CategoryBaseModel.fromJson(
              json['category'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TopicItemBaseModelToJson(TopicItemBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'imageURL': instance.imageUrl,
      'description': instance.description,
      'name': instance.name,
      'levelId': instance.levelId,
      'category': instance.category,
    };

CategoryBaseModel _$CategoryBaseModelFromJson(Map<String, dynamic> json) =>
    CategoryBaseModel(
      id: json['id'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CategoryBaseModelToJson(CategoryBaseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
