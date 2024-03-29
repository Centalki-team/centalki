part of 'topic_detail_bloc.dart';

@immutable
abstract class TopicDetailEvent {
  const TopicDetailEvent();
}

class TopicDetailInitEvent extends TopicDetailEvent {
  const TopicDetailInitEvent();
}

class TopicDetailLoadEvent extends TopicDetailEvent {
  const TopicDetailLoadEvent({required this.topicId});

  final String topicId;
}

class TopicDetailPhraseCreateBookmarkEvent extends TopicDetailEvent {
  const TopicDetailPhraseCreateBookmarkEvent({
    required this.phraseId,
  });

  final String phraseId;
}

class TopicDetailPhraseRemoveBookmarkEvent extends TopicDetailEvent {
  const TopicDetailPhraseRemoveBookmarkEvent({
    required this.bookmarkId,
  });

  final String bookmarkId;
}

class TopicDetailAddFavoriteEvent extends TopicDetailEvent {
  const TopicDetailAddFavoriteEvent({required this.topicId});

  final String topicId;
}

class TopicDetailRemoveFavoriteEvent extends TopicDetailEvent {
  const TopicDetailRemoveFavoriteEvent({required this.id});

  final String id;
}

class TopicDetailConnectTeacherEvent extends TopicDetailEvent {
  const TopicDetailConnectTeacherEvent({required this.topicId});

  final String topicId;
}
