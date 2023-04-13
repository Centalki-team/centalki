// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark_topic_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookmarkTopicModel _$BookmarkTopicModelFromJson(Map<String, dynamic> json) =>
    BookmarkTopicModel(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      topicId: json['topicId'] as String?,
      userId: json['userId'] as String?,
      topic: json['topic'] == null
          ? null
          : BookmarkTopicBaseModel.fromJson(
              json['topic'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookmarkTopicModelToJson(BookmarkTopicModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'topicId': instance.topicId,
      'userId': instance.userId,
      'topic': instance.topic,
    };

BookmarkTopicBaseModel _$BookmarkTopicBaseModelFromJson(
        Map<String, dynamic> json) =>
    BookmarkTopicBaseModel(
      data: json['data'] == null
          ? null
          : TopicDetailModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BookmarkTopicBaseModelToJson(
        BookmarkTopicBaseModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
