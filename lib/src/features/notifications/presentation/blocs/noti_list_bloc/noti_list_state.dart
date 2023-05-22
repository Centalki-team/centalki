part of 'noti_list_bloc.dart';

abstract class NotiListState extends Equatable {
  const NotiListState();

  @override
  List<Object?> get props => [];
}

class NotiListInitState extends NotiListState {
  const NotiListInitState();
}

class NotiListLoadingState extends NotiListState {
  const NotiListLoadingState({
    this.showLoading = true,
    this.isLoadMore = false,
    this.isOverlay = false,
  });

  final bool showLoading;
  final bool isLoadMore;
  final bool isOverlay;

  @override
  List<Object?> get props => [
        showLoading,
        isLoadMore,
        isOverlay,
      ];
}

class NotiListLoadDoneState extends NotiListState {
  const NotiListLoadDoneState({
    required this.todayList,
    required this.thisWeekList,
    required this.previousList,
  });

  final List<NotiListItemEntity> todayList;
  final List<NotiListItemEntity> thisWeekList;
  final List<NotiListItemEntity> previousList;

  @override
  List<Object?> get props => [
        todayList,
        thisWeekList,
        previousList,
      ];
}

class NotiListMarkSingleAsReadSuccess extends NotiListState {
  const NotiListMarkSingleAsReadSuccess({
    required this.emitTime,
  });

  final DateTime emitTime;

  @override
  List<Object?> get props => [
        emitTime,
      ];
}

class NotiListErrorState extends NotiListState {
  const NotiListErrorState({
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
