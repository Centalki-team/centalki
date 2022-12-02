

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
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscureText == null ? false : widget.obscureText!,
      cursorColor: colorScheme.primary,
      style: TextStyle(
        color: colorScheme.onSurface,
        fontSize: bodyLargeSize,
        fontWeight: bodyLargeWeight,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: colorScheme.surfaceVariant,
        labelText: widget.labelText,
        labelStyle: TextStyle(
          color: widget.errorText == null ? colorScheme.onSurfaceVariant : colorScheme.error,
          fontSize: bodyLargeSize,
          fontWeight: bodyLargeWeight,
        ),
        floatingLabelStyle: TextStyle(
          color: widget.errorText == null ? colorScheme.primary : colorScheme.error,
        ),
        icon: widget.icon == null
            ? null
            : Icon(
                widget.icon!,
                size: 20,
              ),
        iconColor: widget.icon == null ? null : colorScheme.onSurfaceVariant,
        suffixIcon: widget.suffixIcon == null
            ? null
            : Icon(
                widget.suffixIcon!,
                size: 24,
              ),
        suffixIconColor:
            widget.suffixIcon == null ? null : colorScheme.onSurfaceVariant,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurfaceVariant,
            width: enabledActiveIndicatorFilledTextField,
          ),
        ),
        disabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(disabledActiveIndicatorOpacityFilledTextField),
            width: disabledActiveIndicatorFilledTextField,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: focusedActiveIndicatorFilledTextField,
          ),
        ),
        errorText: widget.errorText == null ? null : widget.errorText!,
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        errorStyle: TextStyle(
          color: colorScheme.error,
        ),
      ),
      keyboardType: widget.textInputType == null ? null : widget.textInputType!,
    );
  }
}
