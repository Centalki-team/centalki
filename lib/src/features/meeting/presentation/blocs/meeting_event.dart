part of 'meeting_bloc.dart';

abstract class MeetingEvent {
  const MeetingEvent();
}

class MeetingInitEvent extends MeetingEvent {
  const MeetingInitEvent({required this.session});

  final SessionScheduleEntity session;
}

class MeetingJoinRoomEvent extends MeetingEvent {
  const MeetingJoinRoomEvent();
}

class MeetingExitRoomEvent extends MeetingEvent {
  const MeetingExitRoomEvent();
}

class MeetingOccurErrorEvent extends MeetingEvent {
  const MeetingOccurErrorEvent();
}

class MeetingParticipantJoinedEvent extends MeetingEvent {
  const MeetingParticipantJoinedEvent();
}

class MeetingParticipantLeftEvent extends MeetingEvent {
  const MeetingParticipantLeftEvent();
}