import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../domain/entities/language_entity.dart';

class RadioRow extends StatelessWidget {
  const RadioRow({
    super.key,
    required this.value,
    this.isSelected = false,
    this.onSelect,
  });

  final LanguageEntity value;
  final bool isSelected;
  final Function(LanguageEntity)? onSelect;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: isSelected ? null : () => onSelect?.call(value),
        child: Padding(
          padding: const EdgeInsets.all(padding16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: titleSmallSize,
                    fontWeight: titleSmallWeight,
                    color: AppColor.defaultFont,
                  ),
                ),
              ),
              Icon(
                isSelected
                    ? Icons.radio_button_checked_outlined
                    : Icons.radio_button_off_outlined,
                color: isSelected ? AppColor.mainColor2 : AppColor.defaultFont,
              )
            ],
          ),
        ),
      );
}
