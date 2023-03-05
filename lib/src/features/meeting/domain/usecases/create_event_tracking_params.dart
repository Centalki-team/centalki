class CreateEventTrackingParams {
  const CreateEventTrackingParams({
    required this.sessionId,
    required this.event,
  });

  final String sessionId;
  final String event;
}