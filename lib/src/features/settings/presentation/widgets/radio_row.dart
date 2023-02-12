import 'package:flutter/material.dart';

import '../../../../../gen/assets.gen.dart';

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
  Widget build(BuildContext context) => SizedBox(
        height: 24.0,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 16.0,
                letterSpacing: 0.15,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          GestureDetector(
            onTap: isSelected
                ? null
                : () {
                    onSelect?.call(title);
                  },
            child: isSelected
                ? Assets.icon.radioSelected.svg()
                : Assets.icon.radioUnselected.svg(),
          )
        ]),
      );
}
