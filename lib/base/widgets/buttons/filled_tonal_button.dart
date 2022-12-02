

import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppFilledTonalButton extends StatefulWidget {
  const AppFilledTonalButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? icon;

  @override
  State<AppFilledTonalButton> createState() => _AppFilledTonalButtonState();
}

class _AppFilledTonalButtonState extends State<AppFilledTonalButton> {
  @override
  Widget build(BuildContext context) {
    return widget.icon == null
        ? ElevatedButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(colorScheme.secondaryContainer),
              foregroundColor:
                  MaterialStateProperty.all(colorScheme.onSecondaryContainer),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
              overlayColor: MaterialStateProperty.all(
                colorScheme.onSecondaryContainer.withOpacity(0.08),
              ),
            ),
            child: Text(
              widget.text,
            ),
          )
        : ElevatedButton.icon(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(colorScheme.secondaryContainer),
              foregroundColor:
                  MaterialStateProperty.all(colorScheme.onSecondaryContainer),
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontSize: labelLargeSize,
                  fontWeight: labelLargeWeight,
                ),
              ),
              elevation: MaterialStateProperty.all(0.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
              overlayColor: MaterialStateProperty.all(
                colorScheme.onSecondaryContainer.withOpacity(0.08),
              ),
            ),
            icon: Icon(
              widget.icon!,
              size: iconButtonSize,
              color: colorScheme.onSecondaryContainer,
            ),
            label: Text(
              widget.text,
            ),
          );
  }
}
