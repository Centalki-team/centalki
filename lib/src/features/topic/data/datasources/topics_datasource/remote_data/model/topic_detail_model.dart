import 'package:centalki/src/features/topic/domain/entities/topic_detail_entity.dart';
import 'package:json_annotation/json_annotation.dart';

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
  final List<Question>? questions;
  final List<Phrase>? phrases;

  factory TopicDetailModel.fromJson(Map<String, dynamic> json) => _$TopicDetailModelFromJson(json);

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

  factory TopicLevelModel.fromJson(Map<String, dynamic> json) => _$TopicLevelModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicLevelModelToJson(this);
}

@JsonSerializable()
class TopicCategoryModel {
  const TopicCategoryModel(this.id, this.name);

  final String? id;
  final String? name;

  factory TopicCategoryModel.fromJson(Map<String, dynamic> json) => _$TopicCategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$TopicCategoryModelToJson(this);
}