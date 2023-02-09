part of 'topic_detail_bloc.dart';

@immutable
abstract class TopicDetailState {
  const TopicDetailState();
}

class TopicDetailInitState extends TopicDetailState {
  const TopicDetailInitState();
}

class TopicDetailLoadDoneState extends TopicDetailState {
  const TopicDetailLoadDoneState({
    required this.topicDetail,
  });

  final TopicDetailEntity topicDetail;
}

class TopicDetailLoadFailedState extends TopicDetailState {
  const TopicDetailLoadFailedState({
    required this.errorMessage,
  });

  final String errorMessage;
}