part of 'intermediate_topics_bloc.dart';

abstract class IntermediateTopicsEvent {
  const IntermediateTopicsEvent();
}

class IntermediateTopicsInitEvent extends IntermediateTopicsEvent {
  const IntermediateTopicsInitEvent();
}

class IntermediateTopicsLoadEvent extends IntermediateTopicsEvent {
  const IntermediateTopicsLoadEvent();
}

class IntermediateTopicsAddFavoriteEvent extends IntermediateTopicsEvent {
  const IntermediateTopicsAddFavoriteEvent({required this.topicId});

  final String topicId;
}

class IntermediateTopicsRemoveFavoriteEvent
    extends IntermediateTopicsEvent {
  const IntermediateTopicsRemoveFavoriteEvent({required this.id});

  final String id;
}