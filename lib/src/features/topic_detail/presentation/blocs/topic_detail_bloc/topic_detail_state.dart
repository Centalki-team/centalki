part of 'topic_detail_bloc.dart';

abstract class TopicDetailState extends Equatable {
  const TopicDetailState({this.message = ''});

  final String message;

  @override
  List<Object?> get props => [];
}

class TopicDetailInitState extends TopicDetailState {
  const TopicDetailInitState();
}

class TopicDetailLoadDoneState extends TopicDetailState {
  const TopicDetailLoadDoneState({
    required this.topicDetail,
  });

  final TopicDetailEntity topicDetail;

  @override
  List<Object?> get props => [
        topicDetail,
      ];
}

class TopicDetailLoadFailedState extends TopicDetailState {
  const TopicDetailLoadFailedState({
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

class TopicPhraseCreateBookmarkSuccessState extends TopicDetailState {
  const TopicPhraseCreateBookmarkSuccessState({
    required this.phraseId,
    required this.emitTime,
  });

  final String phraseId;
  final DateTime emitTime;

  @override
  List<Object?> get props => [
        phraseId,
        emitTime,
      ];
}

class TopicPhraseRemoveBookmarkSuccessState extends TopicDetailState {
  const TopicPhraseRemoveBookmarkSuccessState({
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

class TopicPhraseBookmarkAdjustFailedState extends TopicDetailState {
  const TopicPhraseBookmarkAdjustFailedState({
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

class TopicDetailLoadingState extends TopicDetailState {
  const TopicDetailLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class TopicDetailAddFavoriteDoneState extends TopicDetailState {
  const TopicDetailAddFavoriteDoneState();
}

class TopicDetailRemoveFavoriteDoneState extends TopicDetailState {
  const TopicDetailRemoveFavoriteDoneState();
}

class ConnectTeacherLoadFailureState extends TopicDetailState {
  const ConnectTeacherLoadFailureState(String message)
      : super(message: message);
}

class ConnectTeacherInsufficientBalanceState extends TopicDetailState {
  const ConnectTeacherInsufficientBalanceState(String message)
      : super(message: message);
}

class ConnectTeacherLoadDoneState extends TopicDetailState {
  const ConnectTeacherLoadDoneState({required this.sessionId});

  final String sessionId;
}

class ConnectTeacherLoadingState extends TopicDetailState {
  const ConnectTeacherLoadingState();
}
