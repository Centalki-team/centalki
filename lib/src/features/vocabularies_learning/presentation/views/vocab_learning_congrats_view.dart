import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';

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
          Text(
            S.current.txtCongrats,
            style: const TextStyle(
              fontSize: headlineLargeSize,
              fontWeight: headlineLargeWeight,
              color: AppColor.support,
              height: 1,
            ),
          ),
          const SizedBox(
            height: spacing10,
          ),
          Text(
            S.current.txtCompleteRemind,
            style: const TextStyle(
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
