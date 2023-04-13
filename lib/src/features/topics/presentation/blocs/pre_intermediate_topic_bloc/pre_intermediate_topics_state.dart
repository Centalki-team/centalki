part of 'pre_intermediate_topics_bloc.dart';

abstract class PreIntermediateTopicsState extends Equatable {
  const PreIntermediateTopicsState();

  @override
  List<Object?> get props => [];
}

class TopicsInitState extends PreIntermediateTopicsState {
  const TopicsInitState();
}

class PreIntermediateTopicsLoadingState extends PreIntermediateTopicsState {
  const PreIntermediateTopicsLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class PreIntermediateTopicsLoadDoneState extends PreIntermediateTopicsState {
  const PreIntermediateTopicsLoadDoneState({
    required this.topics,
    required this.interestedTopics,
  });

  final List<TopicItemEntity> topics;
  final List<String> interestedTopics;

  @override
  List<Object?> get props => [
        topics,
      ];
}

class PreIntermediateTopicsErrorState extends PreIntermediateTopicsState {
  const PreIntermediateTopicsErrorState({
    required this.exception,
  });

  final AppException exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}

class PreIntermediateTopicsAddFavoriteDoneState
    extends PreIntermediateTopicsState {
  const PreIntermediateTopicsAddFavoriteDoneState();
}
