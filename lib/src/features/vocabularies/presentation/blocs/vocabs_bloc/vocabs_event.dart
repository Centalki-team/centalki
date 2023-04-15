part of 'vocabs_bloc.dart';

abstract class VocabsEvent {
  const VocabsEvent();
}

class VocabsLoadEvent extends VocabsEvent {
  const VocabsLoadEvent();
}

class VocabsRemoveBookmarkEvent extends VocabsEvent {
  const VocabsRemoveBookmarkEvent({
    required this.bookmarkId,
  });

  final String bookmarkId;
}
