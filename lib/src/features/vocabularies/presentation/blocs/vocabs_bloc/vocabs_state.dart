part of 'vocabs_bloc.dart';

abstract class VocabsState extends Equatable {
  const VocabsState();

  @override
  List<Object?> get props => [];
}

class VocabsInitState extends VocabsState {
  const VocabsInitState();
}

class VocabsRemoveBookmarkSuccessState extends VocabsState {
  const VocabsRemoveBookmarkSuccessState({
    required this.bookmarkId,
    required this.emitTime,
  });

  final String bookmarkId;
  final DateTime emitTime;

  @override
  List<Object?> get props => [
        bookmarkId,
        emitTime,
      ];
}

class VocabsErrorState extends VocabsState {
  const VocabsErrorState({
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
