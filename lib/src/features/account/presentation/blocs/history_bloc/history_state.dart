part of 'history_bloc.dart';

abstract class HistoryState extends Equatable {
  const HistoryState({
    this.currentPage = 1,
    this.totalCompletedSessionCount = 0,
    this.sessionList = const [],
  });

  final int currentPage;
  final int totalCompletedSessionCount;
  final List<SessionScheduleEntity> sessionList;

  @override
  List<Object?> get props => [currentPage, sessionList];
}

class HistoryInitState extends HistoryState {
  const HistoryInitState();

  @override
  List<Object?> get props => [];
}

class HistoryLoadingState extends HistoryState {
  const HistoryLoadingState();

  @override
  List<Object?> get props => [];
}

class HistoryLoadDoneState extends HistoryState {
  const HistoryLoadDoneState(
      int page, int count, List<SessionScheduleEntity> sessionList,
      {this.hasReachMax = false})
      : super(currentPage: page, totalCompletedSessionCount: count, sessionList: sessionList);

  final bool hasReachMax;

  @override
  List<Object?> get props => [currentPage, sessionList, hasReachMax];
}

class HistoryLoadFailureState extends HistoryState {
  const HistoryLoadFailureState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
