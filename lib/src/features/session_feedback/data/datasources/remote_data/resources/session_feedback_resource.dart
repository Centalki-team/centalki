import '../../../../../../../base/domain/resource.base.dart';

class SessionFeedbackContentResource extends Resource {
  const SessionFeedbackContentResource()
      : super('/feedback/session/content/student');
}

class SessionGiveFeedbackResource extends Resource {
  const SessionGiveFeedbackResource() : super('/feedback/session/student');
}
