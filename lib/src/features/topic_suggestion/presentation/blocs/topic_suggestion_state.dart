part of 'topic_suggestion_bloc.dart';

abstract class TopicSuggestionState {
  const TopicSuggestionState();
}

class TopicSuggestionInitState extends TopicSuggestionState {
  const TopicSuggestionInitState();
}

class TopicSuggestionLoadingState extends TopicSuggestionState {
  const TopicSuggestionLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;
}

class TopicSuggestionLoadDoneState extends TopicSuggestionState {
  const TopicSuggestionLoadDoneState({required this.contents});

  final List<TopicSuggestionContentEntity> contents;
}

class TopicSuggestionLoadFailedState extends TopicSuggestionState {
  const TopicSuggestionLoadFailedState({
    required this.exception,
  });

  final AppException exception;
}

class TopicSuggestionSendingState extends TopicSuggestionState {
  const TopicSuggestionSendingState();
}

class TopicSuggestionSendDoneState extends TopicSuggestionState {
  const TopicSuggestionSendDoneState();
}

class TopicSuggestionSendErrorState extends TopicSuggestionState {
  const TopicSuggestionSendErrorState({
    required this.exception,
  });

  final AppException exception;
}

class TopicSuggestionValidateState extends TopicSuggestionState {
  const TopicSuggestionValidateState({
    required this.subjectError,
    required this.descriptionError,
    required this.forceDisabled,
  });

  final String subjectError;
  final String descriptionError;
  final bool forceDisabled;
}
