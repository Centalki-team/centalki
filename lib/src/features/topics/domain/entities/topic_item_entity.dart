import '../../../bookmark/topic/domain/entities/bookmark_topic_entity.dart';

class TopicsListEntity {
  const TopicsListEntity({
    this.topics = const [],
  });

  final List<TopicItemEntity>? topics;
}

class TopicItemEntity {
  const TopicItemEntity({
    this.topicId = '',
    this.image = '',
    this.topicName = '',
    this.topicCategory = '',
    this.topicBookmark,
  });

  final String? topicId;
  final String? image;
  final String? topicName;
  final String? topicCategory;
  final BookmarkTopicEntity? topicBookmark;
}
