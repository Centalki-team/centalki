import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';

class FavoriteTopicsEmptyView extends StatelessWidget {
  const FavoriteTopicsEmptyView({super.key});

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icon.icEmptyTopics.image(
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
              S.current.txtNoFavoriteTopicsTitle,
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
              horizontal: padding48,
            ),
            child: Text(
              S.current.txtNoFavoriteTopicsContent,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: bodyMediumSize,
                fontWeight: bodyMediumWeight,
                color: AppColor.shadow,
                height: 20 / 22,
              ),
            ),
          ),
        ],
      );
}
