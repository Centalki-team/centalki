class ReportMeetingParams {
  const ReportMeetingParams({
    required this.reportedId,
    required this.sessionId,
    required this.summary,
    required this.detail,
  });

  final String reportedId;
  final String sessionId;
  final List<String> summary;
  final String detail;
}
