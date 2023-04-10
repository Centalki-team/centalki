import 'package:json_annotation/json_annotation.dart';

import '../../../../../domain/entities/topic_item_entity.dart';

part 'topic_model.g.dart';

@JsonSerializable()
class TopicItemBaseModel extends TopicItemEntity {
  TopicItemBaseModel({
    this.id,
    this.categoryId,
    this.imageUrl,
    this.description,
    this.name,
    this.levelId,
    this.category,
  }) : super(topicId: id, image: imageUrl, topicName: name, topicCategory: category?.name);

  final String? id;
  final String? categoryId;
  @JsonKey(name: 'imageURL')
  final String? imageUrl;
  final String? description;
  final String? name;
  final String? levelId;
  final CategoryBaseModel? category;

  static TopicItemBaseModel fromJson(Map<String, dynamic> json) =>
      _$TopicItemBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicItemBaseModelToJson(this);
}

@JsonSerializable()
class CategoryBaseModel {
  const CategoryBaseModel({
    this.id,
    this.name,
  });

  final String? id;
  final String? name;

  static CategoryBaseModel fromJson(Map<String, dynamic> json) =>
      _$CategoryBaseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryBaseModelToJson(this);
}
