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
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.white,
              textStyle: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              minimumSize: widget.minimumSize,
            ),
            child: Text(
              widget.text,
            ),
          )
        : TextButton.icon(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              foregroundColor: AppColor.mainColor1,
              textStyle: const TextStyle(
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
            ),
          );
}
