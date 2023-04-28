part of 'topic_suggestion_bloc.dart';

abstract class TopicSuggestionEvent {
  const TopicSuggestionEvent();
}

class TopicSuggestionInitEvent extends TopicSuggestionEvent {
  const TopicSuggestionInitEvent();
}

class TopicSuggestionLoadEvent extends TopicSuggestionEvent {
  const TopicSuggestionLoadEvent();
}

class TopicSuggestionValidateEvent extends TopicSuggestionEvent {
  const TopicSuggestionValidateEvent({
    required this.subjectAndCategory,
    required this.descriptionAndRequirements,
    required this.summaryLevel,
  });

  final String subjectAndCategory;
  final String descriptionAndRequirements;
  final List<String> summaryLevel;
}

class TopicSuggestionSendEvent extends TopicSuggestionEvent {
  const TopicSuggestionSendEvent({
    required this.subjectAndCategory,
    required this.descriptionAndRequirements,
    required this.summaryLevel,
  });

  final String subjectAndCategory;
  final String descriptionAndRequirements;
  final List<String> summaryLevel;
}
