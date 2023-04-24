import 'package:collection/collection.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';

part 'vocab_learning_event.dart';
part 'vocab_learning_state.dart';

class VocabLearningBloc extends Bloc<VocabLearningEvent, VocabLearningState> {
  VocabLearningBloc() : super(const VocabLearningInitState()) {
    on<VocabLearningStartEvent>(_onLearningStart);
    on<VocabLearningCompleteEvent>(_onLearningComplete);
  }

  _onLearningStart(VocabLearningStartEvent event, emit) {
    final randomVocabs = event.vocabsList.sample(5);
    emit(VocabLearningStartState(
      vocabsList: List.from(randomVocabs),
    ));
  }

  _onLearningComplete(VocabLearningCompleteEvent event, emit) =>
      emit(const VocabLearningCongratState());
}
