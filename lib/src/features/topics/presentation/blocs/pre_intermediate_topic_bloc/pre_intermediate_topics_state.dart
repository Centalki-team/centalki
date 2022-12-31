part of 'pre_intermediate_topics_bloc.dart';

abstract class PreIntermediateTopicsState {
  const PreIntermediateTopicsState();
}

class TopicsInitState extends PreIntermediateTopicsState {
  const TopicsInitState();
}

class PreIntermediateTopicsLoadDoneState extends PreIntermediateTopicsState {
  const PreIntermediateTopicsLoadDoneState({
    required this.topics,
  });

  final TopicsListEntity topics;
}
