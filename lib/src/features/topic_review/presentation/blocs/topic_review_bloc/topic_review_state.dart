part of 'topic_review_bloc.dart';

abstract class TopicReviewState extends Equatable {
  const TopicReviewState();

  @override
  List<Object?> get props => [];
}

class TopicReviewInitState extends TopicReviewState {
  const TopicReviewInitState();
}

class TopicReviewLoadingState extends TopicReviewState {
  const TopicReviewLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;

  @override
  List<Object?> get props => [
        showLoading,
      ];
}

class TopicReviewOptionsLoadedState extends TopicReviewState {
  const TopicReviewOptionsLoadedState({
    required this.topicFeedbackOptionsEntity,
  });

  final TopicFeedbackOptionsEntity topicFeedbackOptionsEntity;

  @override
  List<Object?> get props => [
        topicFeedbackOptionsEntity,
      ];
}

class TopicReviewSendFeedbackDoneState extends TopicReviewState {
  const TopicReviewSendFeedbackDoneState({
    required this.topicFeedbackResponseEntity,
  });

  final TopicFeedbackResponseEntity topicFeedbackResponseEntity;

  @override
  List<Object?> get props => [
        topicFeedbackResponseEntity,
      ];
}

class TopicReviewErrorState extends TopicReviewState {
  const TopicReviewErrorState({
    required this.exception,
    required this.emitTime,
  });

  final AppException exception;
  final DateTime emitTime;

  @override
  List<Object?> get props => [
        exception,
        emitTime,
      ];
}
