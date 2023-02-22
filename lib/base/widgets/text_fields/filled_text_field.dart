import 'package:flutter/material.dart';

import '../../define/colors.dart';
import '../../define/opacity.dart';
import '../../define/size.dart';
import '../../define/width.dart';

class AppFilledTextField extends StatefulWidget {
  const AppFilledTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    this.obscureText,
    required this.labelText,
    this.errorText,
    this.icon,
    this.suffixIcon,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String labelText;
  final String? errorText;
  final IconData? icon;
  final IconData? suffixIcon;

  @override
  State<AppFilledTextField> createState() => _AppFilledTextFieldState();
}

class _AppFilledTextFieldState extends State<AppFilledTextField> {
  @override
  Widget build(BuildContext context) => TextField(
      controller: widget.controller,
      obscureText: widget.obscureText == null ? false : widget.obscureText!,
      cursorColor: AppColor.mainColor1,
      style: const TextStyle(
        color: AppColor.defaultFont,
        fontSize: bodyLargeSize,
        fontWeight: bodyLargeWeight,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColor.white,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.errorText == null ? AppColor.shadow : AppColor.error,
          fontSize: bodyLargeSize,
          fontWeight: bodyLargeWeight,
        ),
        floatingLabelStyle: TextStyle(
          color: widget.errorText == null ? AppColor.mainColor1 : AppColor.error,
        ),
        icon: widget.icon == null
            ? null
            : Icon(
                widget.icon!,
                size: 20,
              ),
        iconColor: widget.icon == null ? null : AppColor.shadow,
        suffixIcon: widget.suffixIcon == null
            ? null
            : Icon(
                widget.suffixIcon!,
                size: 24,
              ),
        suffixIconColor:
            widget.suffixIcon == null ? null : AppColor.shadow,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.container,
            width: enabledActiveIndicatorFilledTextField,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.container.shade100,
            width: disabledActiveIndicatorFilledTextField,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.mainColor1,
            width: focusedActiveIndicatorFilledTextField,
          ),
        ),
        errorText: widget.errorText == null ? null : widget.errorText!,
        errorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.error,
          ),
        ),
        focusedErrorBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColor.error,
          ),
        ),
        errorStyle: const TextStyle(
          color: AppColor.error,
        ),
      ),
      keyboardType: widget.textInputType == null ? null : widget.textInputType!,
    );
}
