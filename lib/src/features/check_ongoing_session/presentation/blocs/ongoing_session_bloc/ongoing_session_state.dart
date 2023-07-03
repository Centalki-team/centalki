part of 'ongoing_session_bloc.dart';

abstract class OngoingSessionState extends Equatable {
  const OngoingSessionState();

  @override
  List<Object?> get props => [];
}

class OngoingSessionInitState extends OngoingSessionState {
  const OngoingSessionInitState();
}

class OngoingSessionCheckingDoneState extends OngoingSessionState {
  const OngoingSessionCheckingDoneState({
    required this.isInOngoingSession,
    required this.isRecheckForRejoin,
    required this.isCheckForNewSession,
    this.sessionScheduleEntity,
    required this.timeEmit,
  });

  final bool isInOngoingSession;
  final bool isRecheckForRejoin;
  final bool isCheckForNewSession;
  final SessionScheduleEntity? sessionScheduleEntity;
  final DateTime timeEmit;

  @override
  List<Object?> get props => [
        isInOngoingSession,
        isRecheckForRejoin,
        isCheckForNewSession,
        sessionScheduleEntity,
        timeEmit,
      ];
}

class OngoingSessionCheckFailState extends OngoingSessionState {
  const OngoingSessionCheckFailState({
    required this.exception,
    required this.timeEmit,
  });

  final Exception exception;
  final DateTime timeEmit;

  @override
  List<Object?> get props => [
        exception,
        timeEmit,
      ];
}
