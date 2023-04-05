class ReportMeetingParams {
  const ReportMeetingParams({
    required this.reportedId,
    required this.summary,
    required this.detail,
  });

  final String reportedId;
  final List<String> summary;
  final String detail;
}
