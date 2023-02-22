import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/opacity.dart';
import '../../define/size.dart';
import '../../define/width.dart';

class AppOutlinedTextField extends StatefulWidget {
  const AppOutlinedTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    this.obscureText,
    required this.labelText,
    this.errorText,
    this.icon,
    this.suffixIcon,
    this.onChanged,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String labelText;
  final String? errorText;
  final IconData? icon;
  final IconData? suffixIcon;
  final int? maxLines;
  final void Function(String)? onChanged;

  @override
  State<AppOutlinedTextField> createState() => _AppOutlinedTextFieldState();
}

class _AppOutlinedTextFieldState extends State<AppOutlinedTextField> {
  @override
  Widget build(BuildContext context) => TextField(
        maxLines: widget.maxLines,
        controller: widget.controller,
        obscureText: widget.obscureText == null ? false : widget.obscureText!,
        cursorColor: AppColor.mainColor1,
        style: const TextStyle(
          color: AppColor.defaultFont,
          fontSize: bodyLargeSize,
          fontWeight: bodyLargeWeight,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.errorText == null
                ? AppColor.defaultFont
                : AppColor.error,
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
          ),
          floatingLabelStyle: TextStyle(
            color: widget.errorText == null
                ? AppColor.mainColor1
                : AppColor.error,
          ),
          icon: widget.icon == null
              ? null
              : Icon(
                  widget.icon!,
                  size: 24,
                ),
          iconColor: widget.icon == null ? null : AppColor.defaultFont,
          suffixIcon: widget.suffixIcon == null
              ? null
              : Icon(
                  widget.suffixIcon!,
                  size: 24,
                ),
          suffixIconColor:
              widget.suffixIcon == null ? null : AppColor.defaultFont,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.container,
              width: enabledOutlineWidthTextField,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.defaultFont
                  .withOpacity(disabledOutlineOpacityOutlinedTextField),
              width: disabledOutlineWidthTextField,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.mainColor1,
              width: focusedOutlineWidthTextField,
            ),
          ),
          errorText: widget.errorText == null ? null : widget.errorText!,
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.error,
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.error,
            ),
          ),
          errorStyle: const TextStyle(
            color: AppColor.error,
          ),
        ),
        keyboardType:
            widget.textInputType == null ? null : widget.textInputType!,
        onChanged: widget.onChanged,
      );
}
