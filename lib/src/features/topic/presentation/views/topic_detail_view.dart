import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:centalki/base/define/size.dart';
import 'package:flutter/material.dart';

import '../widgets/question_card.dart';
import '../widgets/vocab_card.dart';

class TopicDetail extends StatefulWidget {
  const TopicDetail({Key? key}) : super(key: key);

  @override
  State<TopicDetail> createState() => _TopicDetailState();
}

class _TopicDetailState extends State<TopicDetail> {
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(screenAutoPadding16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'This is topic name',
              style: TextStyle(
                fontSize: headlineSmallSize,
                fontWeight: headlineSmallWeight,
              ),
            ),
            const SizedBox(height: smallSpacing6),
            const Text(
              'Topic Category',
              style: TextStyle(
                fontSize: bodyLargeSize,
                fontWeight: bodyLargeWeight,
              ),
            ),
            const SizedBox(height: smallSpacing6),
            const Text(
              'LEVEL: ELEMENTARY',
              style: TextStyle(fontSize: bodyMediumSize, fontWeight: FontWeight.w500, color: Colors.black45),
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
            const Text('In this topic, you will learn how to share with the teacher '
                'about your daily routine, describe your everyday tasks, '
                'and ask someone about their routine as well'),
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
              itemCount: 2,
              itemBuilder: (context, index) => const QuestionCard(),
            )
          ],
        ),
      ),
    );
  }
}
