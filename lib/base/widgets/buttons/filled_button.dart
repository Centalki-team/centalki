import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

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
          onPressed: widget.onPressed == null ? null : widget.onPressed!,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            textStyle: const TextStyle(
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
            ),
            elevation: 0.0,
            shadowColor: colorScheme.shadow,
            minimumSize: widget.minimumSize,
          ),
          child: Text(
            widget.text,
          ),
        )
      : ElevatedButton.icon(
          onPressed: widget.onPressed == null ? null : widget.onPressed!,
          style: ElevatedButton.styleFrom(
            backgroundColor: colorScheme.primary,
            foregroundColor: colorScheme.onPrimary,
            textStyle: const TextStyle(
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
            ),
            elevation: 0.0,
            shadowColor: colorScheme.shadow,
            minimumSize: widget.minimumSize,
          ),
          icon: Icon(
            widget.icon!,
            size: iconButtonSize,
            color: colorScheme.onPrimary,
          ),
          label: Text(
            widget.text,
          ),
        );
}
