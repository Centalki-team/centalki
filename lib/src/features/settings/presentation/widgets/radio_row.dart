import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';

class RadioRow extends StatelessWidget {
  const RadioRow({
    super.key,
    required this.title,
    this.isSelected = false,
    this.onSelect,
  });

  final String title;
  final bool isSelected;
  final Function(String)? onSelect;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: isSelected ? null : () => onSelect?.call(title),
        child: Padding(
          padding: const EdgeInsets.all(padding16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
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
                isSelected ? Icons.radio_button_checked_outlined : Icons.radio_button_off_outlined,
                color: isSelected ? AppColor.mainColor2 : AppColor.defaultFont,
              )
            ],
          ),
        ),
      );
}
