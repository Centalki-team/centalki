import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../gen/assets.gen.dart';

class CustomBotNavBarItem extends StatelessWidget {
  const CustomBotNavBarItem({
    super.key,
    required this.iconGenImage,
    required this.label,
    this.isSelected = false,
    this.activeColor,
    this.unselectedColor,
  });

  final AssetGenImage iconGenImage;
  final String label;
  final bool isSelected;
  final Color? activeColor;
  final Color? unselectedColor;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          iconGenImage.image(
            width: 24.0,
            height: 24.0,
            color: isSelected
                ? activeColor ?? AppColor.mainColor1
                : unselectedColor ?? AppColor.shadow,
          ),
          const SizedBox(
            height: spacing8,
          ),
          Text(
            label,
          ),
        ]),
      );
}
