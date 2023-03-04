import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';

class SettingSwitchRow extends StatefulWidget {
  const SettingSwitchRow({
    super.key,
    required this.title,
    this.initialValue = false,
    this.onChanged,
  });

  final String title;
  final bool initialValue;
  final Function(bool)? onChanged;

  @override
  State<SettingSwitchRow> createState() => _SettingSwitchRowState();
}

class _SettingSwitchRowState extends State<SettingSwitchRow> {
  late bool currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 32.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: titleSmallSize,
                  fontWeight: titleSmallWeight,
                  color: AppColor.defaultFont,
                ),
              ),
            ),
            CupertinoSwitch(
              activeColor: AppColor.mainColor2,
              thumbColor: currentValue ? AppColor.white : AppColor.shadow,
              trackColor: AppColor.background,
              value: currentValue,
              onChanged: (value) {
                widget.onChanged?.call(value);
                setState(() {
                  currentValue = value;
                });
              },
            ),
          ],
        ),
      );
}
