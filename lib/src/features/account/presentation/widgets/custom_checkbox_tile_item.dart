import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/size.dart';

class CustomCheckboxTile extends StatefulWidget {
  const CustomCheckboxTile({
    super.key,
    required this.title,
    this.value = false,
    this.onChanged,
  });

  final String title;
  final bool value;
  final ValueChanged<bool>? onChanged;

  @override
  State<CustomCheckboxTile> createState() => _CustomCheckboxTileState();
}

class _CustomCheckboxTileState extends State<CustomCheckboxTile> {
  late bool curValue;

  @override
  void initState() {
    super.initState();
    curValue = widget.value;
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          widget.onChanged?.call(!curValue);
          setState(() {
            curValue = !curValue;
          });
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: curValue ? null : AppColor.white,
            boxShadow: curValue
                ? [
                    BoxShadow(
                      color: const Color(0xFF3A3A4F).withOpacity(0.6),
                    ),
                    const BoxShadow(
                      offset: Offset.zero,
                      blurRadius: 8.0,
                      spreadRadius: -1.0,
                      color: AppColor.mainColor2,
                    ),
                  ]
                : [
                    BoxShadow(
                      offset: Offset.zero,
                      blurRadius: 6.0,
                      spreadRadius: 1.0,
                      color: AppColor.shadow.withOpacity(0.5),
                    ),
                  ],
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: AppColor.defaultFont,
                fontSize: bodySmallSize,
                fontWeight: bodySmallWeight,
              ),
            ),
          ),
        ),
      );
}
