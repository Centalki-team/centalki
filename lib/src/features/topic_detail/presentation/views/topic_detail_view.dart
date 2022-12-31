import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../blocs/topic_detail_bloc/topic_detail_bloc.dart';
import '../widgets/question_card.dart';
import '../widgets/phrase_card.dart';

class TopicDetailView extends StatefulWidget {
  const TopicDetailView({Key? key}) : super(key: key);

  @override
  State<TopicDetailView> createState() => _TopicDetailViewState();
}

class _TopicDetailViewState extends State<TopicDetailView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Topic Detail'),
        centerTitle: false,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('TALK'),
          ),
        ],
      ),
      backgroundColor: colorScheme.surface,
      body: BlocBuilder<TopicDetailBloc, TopicDetailState>(
        builder: (context, state) {
          if (state is TopicDetailLoadDoneState) {
            return SingleChildScrollView(
              padding: const EdgeInsets.all(screenAutoPadding16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    state.topicDetail.topicName ?? 'null name. Someone must be joking here',
                    style: const TextStyle(
                      fontSize: headlineSmallSize,
                      fontWeight: headlineSmallWeight,
                    ),
                  ),
                  const SizedBox(height: smallSpacing6),
                  Text(
                    state.topicDetail.topicCategory ?? 'null. This topic is out of this world',
                    style: const TextStyle(
                      fontSize: bodyLargeSize,
                      fontWeight: bodyLargeWeight,
                    ),
                  ),
                  const SizedBox(height: smallSpacing6),
                  Text(
                    'LEVEL: ${state.topicDetail.topicLevel ?? 'null. This topic is for Einstein'}'.toUpperCase(),
                    style: const TextStyle(
                      fontSize: bodyMediumSize,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                  const SizedBox(height: spaceBetweenLine15),
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: titleLargeSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: smallSpacing8),
                  Text(state.topicDetail.topicDescription ?? 'null. This topic is about nothing'),
                  const SizedBox(height: spaceBetweenLine15),
                  const Text(
                    'Vocabulary',
                    style: TextStyle(
                      fontSize: titleLargeSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: smallSpacing8),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.topicDetail.topicPhrases?.length,
                    itemBuilder: (context, index) {
                      final phrase = state.topicDetail.topicPhrases?[index];
                      if (phrase == null) {
                        return const Text('Null Phrase');
                      }
                      return PhraseCard(phraseEntity: phrase);
                    },
                  ),
                  const Text(
                    'Recommended Questions',
                    style: TextStyle(
                      fontSize: titleLargeSize,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: smallSpacing8),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: state.topicDetail.topicQuestions?.length,
                    itemBuilder: (context, index) {
                      final questionContent = state.topicDetail.topicQuestions?[index].questionContent;
                      return QuestionCard(
                        index: index,
                        questionContent: questionContent ?? 'null question',
                      );
                    },
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
