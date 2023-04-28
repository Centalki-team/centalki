part of 'noti_detail_bloc.dart';

abstract class NotiDetailState extends Equatable {
  const NotiDetailState();

  @override
  List<Object?> get props => [];
}

class NotiDetailInitState extends NotiDetailState {
  const NotiDetailInitState();
}

class NotiDetailLoadingState extends NotiDetailState {
  const NotiDetailLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class NotiDetailLoadDoneState extends NotiDetailState {
  const NotiDetailLoadDoneState();
}

class NotiDetailErrorState extends NotiDetailState {
  const NotiDetailErrorState({
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
