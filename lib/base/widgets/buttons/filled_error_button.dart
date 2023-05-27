import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppFilledErrorButton extends StatefulWidget {
  const AppFilledErrorButton({
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
  State<AppFilledErrorButton> createState() => _AppFilledErrorButtonState();
}

class _AppFilledErrorButtonState extends State<AppFilledErrorButton> {
  @override
  Widget build(BuildContext context) => widget.icon == null
      ? ElevatedButton(
          onPressed: widget.onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: AppColor.error,
            shadowColor: AppColor.shadow,
            minimumSize: widget.minimumSize,
          ),
          child: Text(
            widget.text,
            style: const TextStyle(
              fontFamily: 'Dongle',
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
              color: AppColor.white,
            ),
          ),
        )
      : ElevatedButton.icon(
          onPressed: widget.onPressed,
          style: TextButton.styleFrom(
            backgroundColor: AppColor.error,
            foregroundColor: AppColor.white,
            elevation: 0.0,
            shadowColor: AppColor.shadow,
            minimumSize: widget.minimumSize,
            textStyle: const TextStyle(
              fontFamily: 'Dongle',
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
              color: AppColor.white,
            ),
          ),
          icon: Icon(
            widget.icon!,
            size: iconButtonSize,
            color: AppColor.white,
          ),
          label: Text(widget.text),
        );
}
