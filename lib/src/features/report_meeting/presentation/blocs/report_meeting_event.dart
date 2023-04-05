part of 'report_meeting_bloc.dart';

abstract class ReportMeetingEvent {
  const ReportMeetingEvent();
}

class ReportMeetingInitEvent extends ReportMeetingEvent {
  const ReportMeetingInitEvent();
}

class ReportMeetingLoadEvent extends ReportMeetingEvent {
  const ReportMeetingLoadEvent({
    required this.teacherId,
    required this.problems,
    required this.description,
  });

  final String teacherId;
  final List<String> problems;
  final String description;
}
