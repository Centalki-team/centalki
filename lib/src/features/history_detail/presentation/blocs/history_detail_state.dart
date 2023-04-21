part of 'history_detail_bloc.dart';

abstract class HistoryDetailState {
  const HistoryDetailState();
}

class HistoryDetailInitState extends HistoryDetailState {
  const HistoryDetailInitState();
}

class HistoryDetailLoadingState extends HistoryDetailState {
  const HistoryDetailLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;
}

class HistoryDetailLoadDoneState extends HistoryDetailState {
  const HistoryDetailLoadDoneState();
}

class HistoryDetailLoadFailedState extends HistoryDetailState {
  const HistoryDetailLoadFailedState({
    required this.exception,
  });

  final AppException exception;
}
