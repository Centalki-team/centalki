part of 'topic_detail_bloc.dart';

@immutable
abstract class TopicDetailEvent {
  const TopicDetailEvent();
}

class TopicDetailInitEvent extends TopicDetailEvent {
  const TopicDetailInitEvent();
}

class TopicDetailLoadEvent extends TopicDetailEvent {
  const TopicDetailLoadEvent({required this.topicId});

  final String topicId;
}

class TopicDetailAddFavoriteEvent extends TopicDetailEvent {
  const TopicDetailAddFavoriteEvent({required this.topicId});

  final String topicId;
}

class TopicDetailRemoveFavoriteEvent extends TopicDetailEvent {
  const TopicDetailRemoveFavoriteEvent({required this.topicId});

  final String topicId;
}
