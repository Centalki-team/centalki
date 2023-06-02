part of 'meeting_bloc.dart';

abstract class MeetingState {
  const MeetingState();
}

class MeetingInitState extends MeetingState {
  const MeetingInitState();
}

class MeetingEndState extends MeetingState {
  const MeetingEndState({required this.session, this.notCompleted = false});

  final SessionScheduleEntity session;
  final bool notCompleted;
}

class MeetingInitAndroidState extends MeetingState {
  const MeetingInitAndroidState();
}

class MeetingInitIosState extends MeetingState {
  const MeetingInitIosState({
    required this.options,
    required this.listeners,
  });

  final JitsiMeetingOptions options;
  final JitsiMeetingListener listeners;
}
