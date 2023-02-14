part of 'history_bloc.dart';

abstract class HistoryState {
  const HistoryState();
}

class HistoryInitState extends HistoryState {
  const HistoryInitState();
}

class HistoryLoadingState extends HistoryState {
  const HistoryLoadingState();
}

class HistoryLoadDoneState extends HistoryState {
  const HistoryLoadDoneState();
}

class HistoryLoadFailureState extends HistoryState {
  const HistoryLoadFailureState(this.message);

  final String message;
}