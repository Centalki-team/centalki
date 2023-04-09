part of 'self_review_bloc.dart';

abstract class SelfReviewEvent {
  const SelfReviewEvent();
}

class SelfReviewGetLevelsEvent extends SelfReviewEvent {
  const SelfReviewGetLevelsEvent();
}
