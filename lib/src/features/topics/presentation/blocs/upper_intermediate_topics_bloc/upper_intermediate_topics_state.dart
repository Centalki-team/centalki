part of 'upper_intermediate_topics_bloc.dart';

abstract class UpperIntermediateTopicsState extends Equatable {
  const UpperIntermediateTopicsState();

  @override
  List<Object?> get props => [];
}

class UpperIntermediateTopicsInitState extends UpperIntermediateTopicsState {
  const UpperIntermediateTopicsInitState();
}

class UpperIntermediateTopicsLoadingState extends UpperIntermediateTopicsState {
  const UpperIntermediateTopicsLoadingState({
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

class UpperIntermediateTopicsLoadDoneState
    extends UpperIntermediateTopicsState {
  const UpperIntermediateTopicsLoadDoneState({
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

class UpperIntermediateTopicsErrorState extends UpperIntermediateTopicsState {
  const UpperIntermediateTopicsErrorState({
    required this.exception,
  });

  final AppException exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}

class UpperIntermediateTopicsAddFavoriteDoneState
    extends UpperIntermediateTopicsState {
  const UpperIntermediateTopicsAddFavoriteDoneState();
}

class UpperIntermediateTopicsRemoveFavoriteDoneState
    extends UpperIntermediateTopicsState {
  const UpperIntermediateTopicsRemoveFavoriteDoneState();
}
