import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:centalki/base/define/size.dart';
import 'package:flutter/material.dart';
class VocabularyCard extends StatelessWidget {
  const VocabularyCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'exercise (noun, countable)',
            style: TextStyle(
              fontSize: titleMediumSize,
              fontWeight: titleMediumWeight,
              color: colorScheme.primary,
            ),
          ),
          const SizedBox(height: smallSpacing4),
          const Text(
            'bài thể dục\nbài tập',
            style: TextStyle(
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
            ),
          ),
          const SizedBox(height: smallSpacing4),
          const Text(
            'Example',
            style: TextStyle(
              fontSize: bodyMediumSize,
              fontWeight: bodyMediumWeight,
            ),
          ),
          const Text(' - Sentence 1'),
          const Text(' - Sentence 2')
        ],
      ),
    );
  }
}
