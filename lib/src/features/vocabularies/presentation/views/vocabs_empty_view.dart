import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';

class VocabsEmptyView extends StatelessWidget {
  const VocabsEmptyView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icon.icEmptyVocabs.image(
            width: 80.0,
            height: 80.0,
          ),
          const SizedBox(
            height: spacing40,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: padding16,
            ),
            child: Text(
              S.current.txtNoFavoriteVocabsTitle,
              style: TextStyle(
                fontSize: titleMediumSize,
                fontWeight: titleMediumWeight,
                color: colorsByTheme(context).defaultFont,
                height: 1.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: spacing40 + spacing4,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: spacing16,
            ),
            child: Text(
              S.current.txtNoFavoriteVocabsContent,
              style: const TextStyle(
                fontSize: bodyMediumSize,
                fontWeight: bodyMediumWeight,
                color: AppColor.shadow,
                height: 20 / 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
}
