import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:centalki/base/define/size.dart';
import 'package:centalki/src/features/topic/presentation/blocs/topic_detail_bloc/topic_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/question_card.dart';
import '../widgets/vocab_card.dart';

class TopicDetailView extends StatefulWidget {
  const TopicDetailView({Key? key, required this.topicId}) : super(key: key);

  final String topicId;

  @override
  State<TopicDetailView> createState() => _TopicDetailViewState();
}

class _TopicDetailViewState extends State<TopicDetailView> {
  @override
  void initState() {
    context.read<TopicDetailBloc>().add(TopicDetailLoadEvent(widget.topicId));
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
                    itemCount: 2,
                    itemBuilder: (context, index) => const VocabularyCard(),
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
