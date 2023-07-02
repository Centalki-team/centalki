part of 'ongoing_session_bloc.dart';

abstract class OngoingSessionEvent {
  const OngoingSessionEvent();
}

class OngoingSessionCheckingEvent extends OngoingSessionEvent {
  const OngoingSessionCheckingEvent({
    this.isRecheckForRejoin = false,
  });

  final bool isRecheckForRejoin;
}
