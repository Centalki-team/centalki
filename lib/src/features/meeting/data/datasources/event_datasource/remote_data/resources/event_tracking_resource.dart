import '../../../../../../../../base/domain/resource.base.dart';

class EventTrackingResource extends Resource {
  const EventTrackingResource({required this.sessionId})
      : super('/session-schedule/$sessionId/event-tracking');

  final String sessionId;
}
