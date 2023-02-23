import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/size.dart';

class AppTextButton extends StatefulWidget {
  const AppTextButton({
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
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) => widget.icon == null
        ? TextButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.white,
              textStyle: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              minimumSize: widget.minimumSize,
            ),
            child: Text(
              widget.text,
              style: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
                color: AppColor.mainColor1,
              ),
            ),
          )
        : TextButton.icon(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.white,
              textStyle: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              minimumSize: widget.minimumSize,
            ),
            icon: Icon(
              widget.icon!,
              size: iconButtonSize,
              color: AppColor.mainColor1,
            ),
            label: Text(
              widget.text,
              style: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
                color: AppColor.mainColor1,
              ),
            ),
          );
}
