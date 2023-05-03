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
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class IntermediateTopicsLoadDoneState extends IntermediateTopicsState {
  const IntermediateTopicsLoadDoneState({
    required this.topics,
  });

  final List<TopicItemEntity> topics;

  @override
  List<Object?> get props => [
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

class IntermediateTopicsRemoveFavoriteDoneState extends IntermediateTopicsState {
  const IntermediateTopicsRemoveFavoriteDoneState();
}