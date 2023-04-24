import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../gen/assets.gen.dart';

class VocabLearningCongratsView extends StatelessWidget {
  const VocabLearningCongratsView({
    super.key,
    this.onLearnMore,
  });

  final Function()? onLearnMore;

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.images.imgFirework.image(
            width: 170,
            height: 167,
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: spacing16,
            width: double.infinity,
          ),
          const Text(
            TextDoc.txtCongrats,
            style: TextStyle(
              fontSize: headlineLargeSize,
              fontWeight: headlineLargeWeight,
              color: AppColor.support,
              height: 1,
            ),
          ),
          const SizedBox(
            height: spacing10,
          ),
          const Text(
            TextDoc.txtCompleteRemind,
            style: TextStyle(
              fontSize: bodyLargeSize,
              fontWeight: bodyLargeWeight,
              color: AppColor.defaultFont,
              height: 1,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      );
}
