class SessionGiveFeedbackEntity {
  const SessionGiveFeedbackEntity({
    required this.id,
    required this.sessionRating,
    required this.summarySatisfied,
    required this.summaryNotSatisfied,
    this.satisfiedDescription,
    this.notSatisfiedDescription,
    this.suggestions,
  });

  final String id;
  final double sessionRating;
  final List<String> summarySatisfied;
  final List<String> summaryNotSatisfied;
  final String? satisfiedDescription;
  final String? notSatisfiedDescription;
  final String? suggestions;
}
