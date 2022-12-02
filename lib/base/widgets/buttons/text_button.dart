import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? icon;

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) {
    return widget.icon == null
        ? TextButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(colorScheme.primary),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              overlayColor: MaterialStateProperty.all(
                colorScheme.primary.withOpacity(0.08),
              ),
            ),
            child: Text(
              widget.text,
            ),
          )
        : TextButton.icon(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(colorScheme.primary),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              overlayColor: MaterialStateProperty.all(
                colorScheme.primary.withOpacity(0.08),
              ),
            ),
            icon: Icon(
              widget.icon!,
              size: iconButtonSize,
              color: colorScheme.primary,
            ),
            label: Text(
              widget.text,
            ),
          );
  }
}
