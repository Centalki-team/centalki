part of 'search_topics_bloc.dart';

abstract class SearchTopicsEvent {
  const SearchTopicsEvent();
}

class SearchTopicsQuerySubmitEvent extends SearchTopicsEvent {
  const SearchTopicsQuerySubmitEvent({
    required this.searchContent,
  });

  final String searchContent;
}
