part of 'vocabs_bloc.dart';

abstract class VocabsEvent {
  const VocabsEvent();
}

class VocabsBookmarkedLoadEvent extends VocabsEvent {
  const VocabsBookmarkedLoadEvent();
}

class VocabsRemoveBookmarkEvent extends VocabsEvent {
  const VocabsRemoveBookmarkEvent({
    required this.bookmarkId,
  });

  final String bookmarkId;
}
