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
  });

  final String? topicId;
  final String? image;
  final String? topicName;
  final String? topicCategory;
}
