import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../generated/l10n.dart';

class VocabLearningNotEnoughView extends StatelessWidget {
  const VocabLearningNotEnoughView({
    super.key,
    required this.currentVocabsQuantity,
  });

  final int currentVocabsQuantity;

  @override
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: AppColor.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: colorsByTheme(context).defaultFont,
            ),
            onPressed: Navigator.of(context).pop,
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.note_add_outlined,
              size: 64.0,
              color: AppColor.shadow,
            ),
            const SizedBox(
              height: spacing60,
            ),
            Text(
              S.current.txtVocabLearningSuggestion,
              style: TextStyle(
                fontSize: titleLargeSize,
                fontWeight: titleLargeWeight,
                color: colorsByTheme(context).defaultFont,
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
