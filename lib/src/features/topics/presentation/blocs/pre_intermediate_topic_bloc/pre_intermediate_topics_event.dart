part of 'pre_intermediate_topics_bloc.dart';

abstract class PreIntermediateTopicsEvent {
  const PreIntermediateTopicsEvent();
}

class PreIntermediateTopicsInitEvent extends PreIntermediateTopicsEvent {
  const PreIntermediateTopicsInitEvent();
}

class PreIntermediateTopicsLoadEvent extends PreIntermediateTopicsEvent {
  const PreIntermediateTopicsLoadEvent({
    this.isRefresh = false,
  });

  final bool isRefresh;
}

class PreIntermediateTopicsAddFavoriteEvent extends PreIntermediateTopicsEvent {
  const PreIntermediateTopicsAddFavoriteEvent({required this.topicId});

  final String topicId;
}

class PreIntermediateTopicsRemoveFavoriteEvent
    extends PreIntermediateTopicsEvent {
  const PreIntermediateTopicsRemoveFavoriteEvent({required this.id});

  final String id;
}
