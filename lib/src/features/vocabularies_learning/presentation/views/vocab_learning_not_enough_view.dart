import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';

class VocabLearningNotEnoughView extends StatelessWidget {
  const VocabLearningNotEnoughView({
    super.key,
    required this.currentVocabsQuantity,
  });

  final int currentVocabsQuantity;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.white,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              TextDoc.txtVocabLearningSuggestion,
              style: TextStyle(
                fontSize: titleLargeSize,
                fontWeight: titleLargeWeight,
                color: AppColor.defaultFont,
                height: 28 / 30,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: spacing28,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.5),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text:
                          'You currently have only $currentVocabsQuantity.\nConsider saving some more in ',
                      style: const TextStyle(
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                        color: AppColor.shadow,
                        height: 20 / 22,
                      ),
                    ),
                    const TextSpan(
                      text: 'Vocabulary',
                      style: TextStyle(
                        fontSize: bodyMediumSize,
                        fontWeight: FontWeight.w400,
                        color: AppColor.shadow,
                        height: 20 / 22,
                      ),
                    ),
                    const TextSpan(
                      text: ' section of any topic to start learning.',
                      style: TextStyle(
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                        color: AppColor.shadow,
                        height: 20 / 22,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      );
}