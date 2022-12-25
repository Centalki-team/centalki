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
