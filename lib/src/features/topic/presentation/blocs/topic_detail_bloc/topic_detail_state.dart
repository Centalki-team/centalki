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

  final TopicDetail topicDetail;
}
