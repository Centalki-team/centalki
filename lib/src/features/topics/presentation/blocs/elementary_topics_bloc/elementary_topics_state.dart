part of 'elementary_topics_bloc.dart';

abstract class ElementaryTopicsState extends Equatable {
  const ElementaryTopicsState();

  @override
  List<Object?> get props => [];
}

class ElementaryTopicsInitState extends ElementaryTopicsState {
  const ElementaryTopicsInitState();
}

class ElementaryTopicsLoadingState extends ElementaryTopicsState {
  const ElementaryTopicsLoadingState({
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

class ElementaryTopicsLoadDoneState extends ElementaryTopicsState {
  const ElementaryTopicsLoadDoneState({
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

class ElementaryTopicsErrorState extends ElementaryTopicsState {
  const ElementaryTopicsErrorState({
    required this.exception,
  });

  final AppException exception;

  @override
  List<Object?> get props => [
        exception,
      ];
}

class ElementaryTopicsAddFavoriteDoneState extends ElementaryTopicsState {
  const ElementaryTopicsAddFavoriteDoneState();
}

class ElementaryTopicsRemoveFavoriteDoneState extends ElementaryTopicsState {
  const ElementaryTopicsRemoveFavoriteDoneState();
}
