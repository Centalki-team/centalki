part of 'vocab_learning_bloc.dart';

abstract class VocabLearningState extends Equatable {
  const VocabLearningState();

  @override
  List<Object?> get props => [];
}

class VocabLearningInitState extends VocabLearningState {
  const VocabLearningInitState();
}

class VocabLearningStartState extends VocabLearningState {
  const VocabLearningStartState({
    required this.vocabsList,
  });

  final List<BookmarkVocabsItemEntity> vocabsList;

  @override
  List<Object?> get props => [
        vocabsList,
      ];
}

class VocabLearningCongratState extends VocabLearningState {
  const VocabLearningCongratState();
}
