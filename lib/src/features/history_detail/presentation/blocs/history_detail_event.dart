part of 'history_detail_bloc.dart';

abstract class HistoryDetailEvent {
  const HistoryDetailEvent();
}

class HistoryDetailInitEvent extends HistoryDetailEvent {
  const HistoryDetailInitEvent();
}

class HistoryDetailLoadEvent extends HistoryDetailEvent {
  const HistoryDetailLoadEvent();
}
