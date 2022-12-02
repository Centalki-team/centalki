import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppFilledButton extends StatefulWidget {
  const AppFilledButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? icon;

  @override
  State<AppFilledButton> createState() => _AppFilledButtonState();
}

class _AppFilledButtonState extends State<AppFilledButton> {
  @override
  Widget build(BuildContext context) {
    return widget.icon == null
        ? ElevatedButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(colorScheme.primary),
              foregroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
              overlayColor: MaterialStateProperty.all(
                colorScheme.onPrimary.withOpacity(0.08),
              ),
            ),
            child: Text(
              widget.text,
            ),
          )
        : ElevatedButton.icon(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(colorScheme.primary),
              foregroundColor: MaterialStateProperty.all(colorScheme.onPrimary),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
              overlayColor: MaterialStateProperty.all(
                colorScheme.onPrimary.withOpacity(0.08),
              ),
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
}
