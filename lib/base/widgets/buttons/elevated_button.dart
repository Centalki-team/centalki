import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppElevatedButton extends StatefulWidget {
  const AppElevatedButton({
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
  State<AppElevatedButton> createState() => _AppElevatedButtonState();
}

class _AppElevatedButtonState extends State<AppElevatedButton> {
  @override
  Widget build(BuildContext context) => widget.icon == null
        ? ElevatedButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.secondary,
              surfaceTintColor: AppColor.secondary,
              foregroundColor: AppColor.defaultFont,
              textStyle: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 5.0,
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
              foregroundColor: AppColor.secondary,
              textStyle: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 1.0,
              shadowColor: AppColor.shadow,
              minimumSize: widget.minimumSize,
            ),
            icon: Icon(
              widget.icon!,
              size: iconButtonSize,
              color: AppColor.defaultFont,
            ),
            label: Text(
              widget.text,
            ),
          );
}
