import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';
import '../blocs/vocab_learning_bloc/vocab_learning_bloc.dart';
import 'vocab_learning_not_enough_view.dart';
import 'vocab_learning_view.dart';

class VocabLearningPage extends StatelessWidget {
  const VocabLearningPage({
    super.key,
    required this.vocabsList,
  });

  final List<BookmarkVocabsItemEntity> vocabsList;

  @override
  Widget build(BuildContext context) => vocabsList.length >= 10
      ? BlocProvider(
          create: (context) => VocabLearningBloc(),
          child: VocabLearningView(
            vocabsList: vocabsList,
          ),
        )
      : VocabLearningNotEnoughView(
          currentVocabsQuantity: vocabsList.length,
        );
}
