part of 'elementary_topics_bloc.dart';

abstract class ElementaryTopicsEvent {
  const ElementaryTopicsEvent();
}

class ElementaryTopicsInitEvent extends ElementaryTopicsEvent {
  const ElementaryTopicsInitEvent();
}

class ElementaryTopicsLoadEvent extends ElementaryTopicsEvent {
  const ElementaryTopicsLoadEvent();
}

class ElementaryTopicsAddFavoriteEvent extends ElementaryTopicsEvent {
  const ElementaryTopicsAddFavoriteEvent({required this.topicId});

  final String topicId;
}

class ElementaryTopicsRemoveFavoriteEvent
    extends ElementaryTopicsEvent {
  const ElementaryTopicsRemoveFavoriteEvent({required this.id});

  final String id;
}