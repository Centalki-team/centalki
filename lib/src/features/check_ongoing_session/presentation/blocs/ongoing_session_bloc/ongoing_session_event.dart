part of 'ongoing_session_bloc.dart';

abstract class OngoingSessionEvent {
  const OngoingSessionEvent();
}

class OngoingSessionInitEvent extends OngoingSessionEvent {
  const OngoingSessionInitEvent();
}

class OngoingSessionCheckingEvent extends OngoingSessionEvent {
  const OngoingSessionCheckingEvent({
    this.isRecheckForRejoin = false,
    this.isCheckForNewSession = false,
  });

  final bool isRecheckForRejoin;
  final bool isCheckForNewSession;
}
