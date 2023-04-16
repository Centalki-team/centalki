part of 'search_topics_bloc.dart';

abstract class SearchTopicsState extends Equatable {
  const SearchTopicsState();

  @override
  List<Object?> get props => [];
}

class SearchTopicsInitState extends SearchTopicsState {
  const SearchTopicsInitState();
}

class SearchTopicsLoadingState extends SearchTopicsState {
  const SearchTopicsLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class SearchTopicsLoadDoneState extends SearchTopicsState {
  const SearchTopicsLoadDoneState({
    required this.topicsListEntity,
  });

  final TopicsListEntity topicsListEntity;

  @override
  List<Object?> get props => [
        topicsListEntity,
      ];
}

class SearchTopicsErrorState extends SearchTopicsState {
  const SearchTopicsErrorState({
    required this.exception,
    required this.emitTime,
  });

  final AppException exception;
  final DateTime emitTime;

  @override
  List<Object?> get props => [
        exception,
        emitTime,
      ];
}
