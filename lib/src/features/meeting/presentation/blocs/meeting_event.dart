part of 'meeting_bloc.dart';

abstract class MeetingEvent {
  const MeetingEvent();
}

class MeetingInitEvent extends MeetingEvent {
  const MeetingInitEvent();
}