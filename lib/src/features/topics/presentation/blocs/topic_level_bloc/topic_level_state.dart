part of 'topic_level_bloc.dart';

@immutable
abstract class TopicLevelState {
  const TopicLevelState();
}

class TopicLevelInitState extends TopicLevelState {
  const TopicLevelInitState();
}

class TopicLevelChangeTabState extends TopicLevelState {
  const TopicLevelChangeTabState({required this.currentTab});

  final int currentTab;
}