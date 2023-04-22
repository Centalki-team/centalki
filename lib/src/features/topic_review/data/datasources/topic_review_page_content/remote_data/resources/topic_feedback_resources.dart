import '../../../../../../../../base/domain/resource.base.dart';

class TopicFeedbackOptionsResource extends Resource {
  const TopicFeedbackOptionsResource() : super('/feedback/topic/content');
}

class SendTopicFeedbackResource extends Resource {
  const SendTopicFeedbackResource() : super('/feedback/topic');
}
