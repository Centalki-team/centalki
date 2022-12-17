part of 'topic_level_bloc.dart';

@immutable
abstract class TopicLevelEvent {
  const TopicLevelEvent();
}

class TopicLevelInitEvent extends TopicLevelEvent {
  const TopicLevelInitEvent();
}

class TopicLevelChangeTabEvent extends TopicLevelEvent {
  const TopicLevelChangeTabEvent({required this.desTab});

  final int desTab;
}
