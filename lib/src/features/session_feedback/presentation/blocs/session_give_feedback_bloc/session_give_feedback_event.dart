part of 'session_give_feedback_bloc.dart';

abstract class SessionGiveFeedbackEvent {
  const SessionGiveFeedbackEvent();
}

class SessionGiveFeedbackInitEvent extends SessionGiveFeedbackEvent {
  const SessionGiveFeedbackInitEvent();
}

class SessionGiveFeedbackLoadEvent extends SessionGiveFeedbackEvent {
  const SessionGiveFeedbackLoadEvent();
}

class SessionGiveFeedbackValidateEvent extends SessionGiveFeedbackEvent {
  const SessionGiveFeedbackValidateEvent({
    required this.rating,
    required this.satisfiedDescription,
    required this.notSatisfiedDescription,
    required this.suggestions,
    required this.summarySatisfied,
    required this.summaryNotSatisfied,
  });

  final double rating;
  final String satisfiedDescription;
  final String notSatisfiedDescription;
  final String suggestions;
  final List<String> summarySatisfied;
  final List<String> summaryNotSatisfied;
}

class SessionGiveFeedbackSendEvent extends SessionGiveFeedbackEvent {
  const SessionGiveFeedbackSendEvent({
    required this.rating,
    required this.satisfiedDescription,
    required this.notSatisfiedDescription,
    required this.suggestions,
    required this.summarySatisfied,
    required this.summaryNotSatisfied,
  });

  final double rating;
  final String satisfiedDescription;
  final String notSatisfiedDescription;
  final String suggestions;
  final List<String> summarySatisfied;
  final List<String> summaryNotSatisfied;
}
