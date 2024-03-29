part of 'session_give_feedback_bloc.dart';

abstract class SessionGiveFeedbackState {
  const SessionGiveFeedbackState();
}

class SessionGiveFeedbackInitState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackInitState();
}

class SessionGiveFeedbackLoadingState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;
}

class SessionGiveFeedbackLoadDoneState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackLoadDoneState({
    required this.contents,
  });

  final SessionFeedbackContentEntity contents;
}

class SessionGiveFeedbackLoadFailedState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackLoadFailedState({
    required this.exception,
  });

  final AppException exception;
}

class SessionGiveFeedbackSendingState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackSendingState();
}

class SessionGiveFeedbackSendDoneState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackSendDoneState();
}

class SessionGiveFeedbackSendErrorState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackSendErrorState({
    required this.exception,
  });

  final AppException exception;
}

class SessionGiveFeedbackValidateState extends SessionGiveFeedbackState {
  const SessionGiveFeedbackValidateState({
    required this.ratingError,
    required this.satisfiedChipError,
    required this.notSatisfiedChipError,
    required this.satisfiedDescriptionError,
    required this.notSatisfiedDescriptionError,
    required this.suggestionsError,
    required this.forceDisabled,
  });

  final String ratingError;
  final String satisfiedChipError;
  final String notSatisfiedChipError;
  final String satisfiedDescriptionError;
  final String notSatisfiedDescriptionError;
  final String suggestionsError;
  final bool forceDisabled;
}
