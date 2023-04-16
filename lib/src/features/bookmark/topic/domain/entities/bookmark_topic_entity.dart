import '../../../../topic_detail/domain/entities/topic_detail_entity.dart';

class BookmarkTopicEntity {
  const BookmarkTopicEntity({
    this.bookmarkId,
    this.bookmarkCreatedAt,
    this.bookmarkTopicId,
    this.bookmarkUserId,
    this.bookmarkTopic,
  });

  final String? bookmarkId;
  final String? bookmarkCreatedAt;
  final String? bookmarkTopicId;
  final String? bookmarkUserId;
  final TopicDetailEntity? bookmarkTopic;
}
