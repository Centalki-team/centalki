import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppOutlinedButton extends StatefulWidget {
  const AppOutlinedButton({
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
  State<AppOutlinedButton> createState() => _AppOutlinedButtonState();
}

class _AppOutlinedButtonState extends State<AppOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return widget.icon == null
        ? OutlinedButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.surface,
              foregroundColor: colorScheme.primary,
              textStyle: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              shadowColor: colorScheme.shadow,
              side: BorderSide(
                color: colorScheme.outline,
              ),
              minimumSize: widget.minimumSize,
            ),
            child: Text(
              widget.text,
            ),
          )
        : OutlinedButton.icon(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.surface,
              foregroundColor: colorScheme.primary,
              textStyle: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              shadowColor: colorScheme.shadow,
              side: BorderSide(
                color: colorScheme.outline,
              ),
              minimumSize: widget.minimumSize,
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
