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
    this.isOverlay = false,
  });

  final bool showLoading;
  final bool isOverlay;

  @override
  List<Object?> get props => [
        showLoading,
        isOverlay,
      ];
}

class PreIntermediateTopicsLoadDoneState extends PreIntermediateTopicsState {
  const PreIntermediateTopicsLoadDoneState({
    required this.logKey,
    required this.logName,
    required this.topics,
  });

  final String logKey;
  final String logName;
  final List<TopicItemEntity> topics;

  @override
  List<Object?> get props => [
        logKey,
        logName,
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

class PreIntermediateTopicsRemoveFavoriteDoneState
    extends PreIntermediateTopicsState {
  const PreIntermediateTopicsRemoveFavoriteDoneState();
}
