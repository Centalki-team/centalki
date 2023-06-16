part of 'intermediate_topics_bloc.dart';

abstract class IntermediateTopicsState extends Equatable {
  const IntermediateTopicsState();

  @override
  List<Object?> get props => [];
}

class IntermediateTopicsInitState extends IntermediateTopicsState {
  const IntermediateTopicsInitState();
}

class IntermediateTopicsLoadingState extends IntermediateTopicsState {
  const IntermediateTopicsLoadingState({
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

class IntermediateTopicsLoadDoneState extends IntermediateTopicsState {
  const IntermediateTopicsLoadDoneState({
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

class IntermediateTopicsErrorState extends IntermediateTopicsState {
  const IntermediateTopicsErrorState({
    required this.exception,
  });

  final AppException exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}

class IntermediateTopicsAddFavoriteDoneState extends IntermediateTopicsState {
  const IntermediateTopicsAddFavoriteDoneState();
}

class IntermediateTopicsRemoveFavoriteDoneState
    extends IntermediateTopicsState {
  const IntermediateTopicsRemoveFavoriteDoneState();
}
