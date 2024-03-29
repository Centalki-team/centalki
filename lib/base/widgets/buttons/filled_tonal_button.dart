import 'package:flutter/material.dart';

import '../../define/styles.dart';
import '../../define/theme.dart';

class AppFilledTonalButton extends StatefulWidget {
  const AppFilledTonalButton({
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
  State<AppFilledTonalButton> createState() => _AppFilledTonalButtonState();
}

class _AppFilledTonalButtonState extends State<AppFilledTonalButton> {
  @override
  Widget build(BuildContext context) => widget.icon == null
        ? ElevatedButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.white,
              foregroundColor: AppColor.mainColor2Container,
              textStyle: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              shadowColor: AppColor.shadow,
              minimumSize: widget.minimumSize,
            ),
            child: Text(
              widget.text,
            ),
          )
        : ElevatedButton.icon(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.white,
              foregroundColor: colorsByTheme(context).defaultFont,
              textStyle: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              shadowColor: AppColor.shadow,
              minimumSize: widget.minimumSize,
            ),
            icon: Icon(
              widget.icon!,
              size: iconButtonSize,
              color: colorsByTheme(context).defaultFont,
            ),
            label: Text(
              widget.text,
            ),
          );
}
