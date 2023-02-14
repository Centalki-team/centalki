part of 'history_bloc.dart';

abstract class HistoryEvent {
  const HistoryEvent();
}

class HistoryInitEvent extends HistoryEvent {
  const HistoryInitEvent();
}