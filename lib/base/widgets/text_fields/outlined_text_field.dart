import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/dimensions.dart';
import '../../define/opacity.dart';
import '../../define/size.dart';
import '../../define/width.dart';

class AppOutlinedTextField extends StatefulWidget {
  const AppOutlinedTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    this.obscureText,
    this.labelText,
    this.errorText,
    this.icon,
    this.suffixIcon,
    this.onChanged,
    this.maxLines = 1,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String? labelText;
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
        obscureText: widget.obscureText ?? false,
        cursorColor: AppColor.mainColor2,
        keyboardType: widget.textInputType,
        onChanged: widget.onChanged,
        style: const TextStyle(
          color: AppColor.defaultFont,
          fontSize: bodyLargeSize,
          fontWeight: bodyLargeWeight,
        ),
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.errorText == null ? AppColor.defaultFont : AppColor.error,
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
          ),
          floatingLabelStyle: TextStyle(
            color: widget.errorText == null ? AppColor.mainColor1 : AppColor.error,
          ),
          errorText: widget.errorText,
          errorStyle: const TextStyle(
            color: AppColor.error,
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
          suffixIconColor: widget.suffixIcon == null ? null : AppColor.defaultFont,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(textFieldRadius)),
            borderSide: BorderSide(
              color: AppColor.container,
              width: enabledOutlineWidthTextField,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(textFieldRadius)),
            borderSide: BorderSide(
              color: AppColor.background.withOpacity(disabledOutlineOpacityOutlinedTextField),
              width: disabledOutlineWidthTextField,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(textFieldRadius)),
            borderSide: BorderSide(
              color: AppColor.mainColor2,
              width: focusedOutlineWidthTextField,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(textFieldRadius)),
            borderSide: BorderSide(
              color: AppColor.error,
              width: errorOutlineWidthTextField / 2
            ),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(textFieldRadius)),
            borderSide: BorderSide(
              color: AppColor.error,
              width: errorOutlineWidthTextField,
            ),
          ),
        ),
      );
}
