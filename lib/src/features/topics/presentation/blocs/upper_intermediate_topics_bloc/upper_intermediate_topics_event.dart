part of 'upper_intermediate_topics_bloc.dart';

abstract class UpperIntermediateTopicsEvent {
  const UpperIntermediateTopicsEvent();
}

class UpperIntermediateTopicsInitEvent extends UpperIntermediateTopicsEvent {
  const UpperIntermediateTopicsInitEvent();
}

class UpperIntermediateTopicsLoadEvent extends UpperIntermediateTopicsEvent {
  const UpperIntermediateTopicsLoadEvent();
}

class UpperIntermediateTopicsAddFavoriteEvent extends UpperIntermediateTopicsEvent {
  const UpperIntermediateTopicsAddFavoriteEvent({required this.topicId});

  final String topicId;
}

class UpperIntermediateTopicsRemoveFavoriteEvent
    extends UpperIntermediateTopicsEvent {
  const UpperIntermediateTopicsRemoveFavoriteEvent({required this.id});

  final String id;
}
