import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? icon;

  @override
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) {
    return widget.icon == null
        ? ElevatedButton(
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
              elevation: MaterialStateProperty.all(1.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
              overlayColor: MaterialStateProperty.all(
                colorScheme.primary.withOpacity(0.08),
              ),
            ),
            child: Text(
              widget.text,
            ),
          )
        : ElevatedButton.icon(
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
              elevation: MaterialStateProperty.all(1.0),
              shadowColor: MaterialStateProperty.all(colorScheme.shadow),
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
