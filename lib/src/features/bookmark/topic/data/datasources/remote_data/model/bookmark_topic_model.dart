import 'package:json_annotation/json_annotation.dart';

import '../../../../../../topic_detail/data/datasources/topics_datasource/remote_data/model/topic_detail_model.dart';
import '../../../../domain/entities/bookmark_topic_entity.dart';

part 'bookmark_topic_model.g.dart';

@JsonSerializable()
class BookmarkTopicModel extends BookmarkTopicEntity {
  BookmarkTopicModel({
    this.id,
    this.createdAt,
    this.topicId,
    this.userId,
    this.topic,
  }) : super(
          bookmarkId: id,
          bookmarkCreatedAt: createdAt,
          bookmarkTopicId: topicId,
          bookmarkUserId: userId,
          bookmarkTopic: topic,
        );

  final String? id;
  final String? createdAt;
  final String? topicId;
  final String? userId;
  final BookmarkTopicBaseModel? topic;

  factory BookmarkTopicModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkTopicModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkTopicModelToJson(this);
}

@JsonSerializable()
class BookmarkTopicBaseModel extends BookmarkTopicBaseEntity {
  BookmarkTopicBaseModel({
    this.data,
  }) : super(
          topic: data,
        );

  final TopicDetailModel? data;

  factory BookmarkTopicBaseModel.fromJson(Map<String, dynamic> json) =>
      _$BookmarkTopicBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$BookmarkTopicBaseModelToJson(this);
}
