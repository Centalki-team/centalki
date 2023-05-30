import 'package:flutter/material.dart';

import '../../define/styles.dart';
import '../../define/theme.dart';

class AppFilledButton extends StatefulWidget {
  const AppFilledButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
    this.minimumSize,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Size? minimumSize;

  @override
  State<AppFilledButton> createState() => _AppFilledButtonState();
}

class _AppFilledButtonState extends State<AppFilledButton> {
  @override
  Widget build(BuildContext context) => widget.icon == null
      ? ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: AppColor.mainColor2,
            disabledBackgroundColor: AppColor.container,
            shadowColor: AppColor.shadow,
            minimumSize: widget.minimumSize,
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
              fontFamily: 'Dongle',
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
              color: AppColor.defaultFontLight,
            ),
          ),
        )
      : ElevatedButton.icon(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            backgroundColor: AppColor.mainColor2,
            disabledBackgroundColor: AppColor.container,
            foregroundColor: colorsByTheme(context).defaultFont,
            elevation: 0.0,
            shadowColor: AppColor.shadow,
            minimumSize: widget.minimumSize,
            textStyle: const TextStyle(
              fontFamily: 'Dongle',
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
            ),
          ),
          icon: Icon(
            widget.icon!,
            size: iconButtonSize,
            color: colorsByTheme(context).defaultFont,
          ),
          label: Text(
            widget.text,
            style: const TextStyle(
              fontFamily: 'Dongle',
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
              color: AppColor.defaultFontLight,
            ),
          ),
        );
}
