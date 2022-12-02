
import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppOutlinedButton extends StatefulWidget {
  const AppOutlinedButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? icon;

  @override
  State<AppOutlinedButton> createState() => _AppOutlinedButtonState();
}

class _AppOutlinedButtonState extends State<AppOutlinedButton> {
  @override
  Widget build(BuildContext context) {
    return widget.icon == null
        ? OutlinedButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(colorScheme.surface),
              foregroundColor: MaterialStateProperty.all(colorScheme.primary),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
              overlayColor: MaterialStateProperty.all(
                colorScheme.outline.withOpacity(0.08),
              ),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: colorScheme.outline,
                ),
              ),
            ),
            child: Text(
              widget.text,
            ),
          )
        : OutlinedButton.icon(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(colorScheme.surface),
              foregroundColor: MaterialStateProperty.all(colorScheme.primary),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
              overlayColor: MaterialStateProperty.all(
                colorScheme.outline.withOpacity(0.08),
              ),
              side: MaterialStateProperty.all(
                BorderSide(
                  color: colorScheme.outline,
                ),
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
