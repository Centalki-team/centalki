part of 'topics_bloc.dart';

abstract class TopicsState {
  const TopicsState();
}

class TopicsInitState extends TopicsState {
  const TopicsInitState();
}

class TopicsLoadDoneState extends TopicsState {
  const TopicsLoadDoneState({
    required this.topics,
  });

  final TopicsListEntity topics;
}
