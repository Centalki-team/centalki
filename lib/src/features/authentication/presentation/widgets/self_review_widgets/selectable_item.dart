import 'package:flutter/material.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/theme.dart';
import '../../../domain/entities/self_review/self_level_entity.dart';

class SelectableLevelItem extends StatelessWidget {
  const SelectableLevelItem({
    super.key,
    required this.selfLevelEntity,
    this.isSelected = false,
  });

  final SelfLevelEntity selfLevelEntity;
  final bool isSelected;

  @override
  Widget build(BuildContext context) => Container(
        padding: isSelected
            ? const EdgeInsets.symmetric(
                horizontal: spacing16,
                vertical: spacing14,
              )
            : const EdgeInsets.all(spacing16),
        decoration: BoxDecoration(
          color: isSelected ? AppColor.mainColor2Surface : AppColor.white,
          borderRadius: BorderRadius.circular(12.0),
          border: isSelected
              ? null
              : Border.all(
                  color: AppColor.container,
                ),
        ),
        child: Row(
          children: [
            if (isSelected) ...[
              Icon(
                Icons.check_sharp,
                size: 20.0,
                color: colorsByTheme(context).defaultFont,
              ),
              const SizedBox(
                width: 12.5,
              ),
            ],
            Text(
              '${selfLevelEntity.code}${selfLevelEntity.code.isNotEmpty ? ' - ' : ''}${selfLevelEntity.name}',
              style: TextStyle(
                fontSize: isSelected ? 20 : bodySmallSize,
                fontWeight: isSelected ? FontWeight.w400 : bodySmallWeight,
                color: colorsByTheme(context).defaultFont,
              ),
            ),
          ],
        ),
      );
}
