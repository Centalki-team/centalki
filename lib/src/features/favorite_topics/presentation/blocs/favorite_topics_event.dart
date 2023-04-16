part of 'favorite_topics_bloc.dart';

abstract class FavoriteTopicsEvent {
  const FavoriteTopicsEvent();
}

class FavoriteTopicsInitEvent extends FavoriteTopicsEvent {
  const FavoriteTopicsInitEvent();
}

class FavoriteTopicsLoadEvent extends FavoriteTopicsEvent {
  const FavoriteTopicsLoadEvent();
}

class RemoveFavoriteTopicEvent extends FavoriteTopicsEvent {
  const RemoveFavoriteTopicEvent({required this.id});

  final String id;
}
