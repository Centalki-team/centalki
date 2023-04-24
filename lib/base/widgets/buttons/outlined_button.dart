import 'package:flutter/material.dart';

import '../../define/styles.dart';

class AppOutlinedButton extends StatefulWidget {
  const AppOutlinedButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.icon,
    this.minimumSize,
    this.textColor,
    this.iconColor,
    this.outlineColor,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final IconData? icon;
  final Size? minimumSize;
  final Color? textColor;
  final Color? iconColor;
  final Color? outlineColor;

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
            textStyle: TextStyle(
              fontFamily: 'Dongle',
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
              color: widget.textColor,
            ),
            elevation: 0.0,
            shadowColor: AppColor.shadow,
            side: BorderSide(
              color: widget.outlineColor ?? AppColor.container,
            ),
            minimumSize: widget.minimumSize,
          ),
          child: Text(
            widget.text,
            style: TextStyle(
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
              color: widget.textColor,
            ),
          ),
        )
      : OutlinedButton.icon(
          onPressed: widget.onPressed == null ? null : widget.onPressed!,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.white,
            foregroundColor: AppColor.mainColor1,
            elevation: 0.0,
            shadowColor: AppColor.shadow,
            side: BorderSide(
              color: widget.outlineColor ?? AppColor.container,
            ),
            minimumSize: widget.minimumSize,
          ),
          icon: Icon(
            widget.icon!,
            size: iconButtonSize,
            color: widget.iconColor ?? AppColor.mainColor1,
          ),
          label: Text(
            widget.text,
            style: TextStyle(
              fontSize: labelLargeSize,
              fontWeight: labelLargeWeight,
              color: widget.textColor,
            ),
          ),
        );
}
