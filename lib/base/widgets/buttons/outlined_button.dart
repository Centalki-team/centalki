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
  Widget build(BuildContext context) => widget.icon == null
        ? OutlinedButton(
            onPressed: widget.onPressed == null ? null : widget.onPressed!,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.white,
              textStyle: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              shadowColor: AppColor.shadow,
              side: const BorderSide(
                color: AppColor.shadow,
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
              backgroundColor: AppColor.white,
              foregroundColor: AppColor.mainColor1,
              textStyle: const TextStyle(
                fontFamily: 'Dongle',
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              elevation: 0.0,
              shadowColor: AppColor.shadow,
              side: const BorderSide(
                color: AppColor.shadow,
              ),
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
