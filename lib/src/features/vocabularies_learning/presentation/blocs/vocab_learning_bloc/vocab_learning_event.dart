part of 'vocab_learning_bloc.dart';

abstract class VocabLearningEvent {
  const VocabLearningEvent();
}

class VocabLearningStartEvent extends VocabLearningEvent {
  const VocabLearningStartEvent({
    required this.vocabsList,
  });

  final List<BookmarkVocabsItemEntity> vocabsList;
}

class VocabLearningCompleteEvent extends VocabLearningEvent {
  const VocabLearningCompleteEvent();
}
