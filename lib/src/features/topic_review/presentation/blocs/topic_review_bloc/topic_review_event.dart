part of 'topic_review_bloc.dart';

abstract class TopicReviewEvent {
  const TopicReviewEvent();
}

class TopicReviewLoadOptionsEvent extends TopicReviewEvent {
  const TopicReviewLoadOptionsEvent();
}

class TopicReviewSendFeedbackEvent extends TopicReviewEvent {
  const TopicReviewSendFeedbackEvent({
    required this.topicFeedbackDataEntity,
  });

  final TopicFeedbackDataEntity topicFeedbackDataEntity;
}
