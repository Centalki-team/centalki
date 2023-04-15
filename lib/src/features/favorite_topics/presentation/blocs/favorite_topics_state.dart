part of 'favorite_topics_bloc.dart';

abstract class FavoriteTopicsState {
  const FavoriteTopicsState();
}

class FavoriteTopicsInitState extends FavoriteTopicsState {
  const FavoriteTopicsInitState();
}

class FavoriteTopicsLoadingState extends FavoriteTopicsState {
  const FavoriteTopicsLoadingState({
    this.showLoading = true,
  });

  final bool showLoading;
}

class FavoriteTopicsLoadDoneState extends FavoriteTopicsState {
  const FavoriteTopicsLoadDoneState({
    required this.bookmarks,
  });

  final List<BookmarkTopicEntity> bookmarks;
}

class FavoriteTopicsErrorState extends FavoriteTopicsState {
  const FavoriteTopicsErrorState({
    required this.exception,
  });

  final AppException exception;
}

class RemoveFavoriteTopicDoneState extends FavoriteTopicsState {
  const RemoveFavoriteTopicDoneState();
}
