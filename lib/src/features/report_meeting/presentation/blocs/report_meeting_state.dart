part of 'report_meeting_bloc.dart';

abstract class ReportMeetingState {
  const ReportMeetingState();
}

class ReportMeetingInitState extends ReportMeetingState {
  const ReportMeetingInitState();
}

class ReportMeetingLoadingState extends ReportMeetingState {
  const ReportMeetingLoadingState();
}

class ReportMeetingLoadDoneState extends ReportMeetingState {
  const ReportMeetingLoadDoneState();
}

class ReportMeetingLoadFailureState extends ReportMeetingState {
  const ReportMeetingLoadFailureState(this.exception);

  final AppException exception;
}