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
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool? obscureText;
  final String labelText;
  final String? errorText;
  final IconData? icon;
  final IconData? suffixIcon;
  final void Function(String)? onChanged;

  @override
  State<AppOutlinedTextField> createState() => _AppOutlinedTextFieldState();
}

class _AppOutlinedTextFieldState extends State<AppOutlinedTextField> {
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
                size: 24,
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.outline,
            width: enabledOutlineWidthTextField,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.onSurface.withOpacity(disabledOutlineOpacityOutlinedTextField),
            width: disabledOutlineWidthTextField,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.primary,
            width: focusedOutlineWidthTextField,
          ),
        ),
        errorText: widget.errorText == null ? null : widget.errorText!,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: colorScheme.error,
          ),
        ),
        errorStyle: TextStyle(
          color: colorScheme.error,
        ),
      ),
      keyboardType: widget.textInputType == null ? null : widget.textInputType!,
      onChanged: widget.onChanged,
    );
  }
}
