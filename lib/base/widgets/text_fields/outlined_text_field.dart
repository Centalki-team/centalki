import 'package:flutter/material.dart';

import '../../define/styles.dart';

class AppOutlinedTextField extends StatefulWidget {
  const AppOutlinedTextField({
    Key? key,
    required this.controller,
    this.textInputType,
    this.obscureText = false,
    this.labelText,
    this.hintText,
    this.errorText,
    this.icon,
    this.suffixIcon,
    this.onChanged,
    this.minLines,
    this.maxLines = 1,
    this.maxLength,
  })  : assert(!(obscureText && suffixIcon != null)),
        super(key: key);

  final TextEditingController controller;
  final TextInputType? textInputType;
  final bool obscureText;
  final String? labelText;
  final String? hintText;
  final String? errorText;
  final IconData? icon;
  final IconData? suffixIcon;
  final int? maxLines;
  final int? minLines;
  final int? maxLength;
  final void Function(String)? onChanged;

  @override
  State<AppOutlinedTextField> createState() => _AppOutlinedTextFieldState();
}

class _AppOutlinedTextFieldState extends State<AppOutlinedTextField> {
  late bool _obscureText;

  @override
  void initState() {
    _obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => TextField(
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        controller: widget.controller,
        obscureText: _obscureText,
        cursorColor: AppColor.mainColor2,
        keyboardType: widget.textInputType,
        onChanged: widget.onChanged,
        style: const TextStyle(
          fontSize: bodyLargeSize,
          fontWeight: bodyLargeWeight,
          color: AppColor.defaultFont,
        ),
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: AppColor.shadow,
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            height: 1,
          ),
          labelText: widget.labelText,
          labelStyle: TextStyle(
            color: widget.errorText == null
                ? AppColor.defaultFont
                : AppColor.error,
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
          ),
          floatingLabelStyle: TextStyle(
            color:
                widget.errorText == null ? AppColor.mainColor2 : AppColor.error,
          ),
          errorText: widget.errorText,
          errorMaxLines: 2,
          errorStyle: const TextStyle(
            fontSize: bodySmallSize,
            fontWeight: bodySmallWeight,
            color: AppColor.error,
          ),
          icon: widget.icon == null
              ? null
              : Icon(
                  widget.icon!,
                  size: 24,
                ),
          iconColor: widget.icon == null ? null : AppColor.defaultFont,
          suffixIcon: widget.obscureText
              ? GestureDetector(
                  onTap: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  child: Icon(
                    _obscureText ? Icons.visibility : Icons.visibility_off,
                    size: 24,
                    color: AppColor.shadow,
                  ),
                )
              : (widget.suffixIcon == null
                  ? null
                  : Icon(
                      widget.suffixIcon!,
                      size: 24,
                    )),
          suffixIconColor:
              widget.suffixIcon == null ? null : AppColor.defaultFont,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius8)),
            borderSide: BorderSide(
              color: AppColor.container,
              width: enabledOutlineWidthTextField,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: const BorderRadius.all(Radius.circular(radius8)),
            borderSide: BorderSide(
              color: AppColor.background
                  .withOpacity(disabledOutlineOpacityOutlinedTextField),
              width: disabledOutlineWidthTextField,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius8)),
            borderSide: BorderSide(
              color: AppColor.mainColor2,
              width: focusedOutlineWidthTextField,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius8)),
            borderSide: BorderSide(
                color: AppColor.error, width: errorOutlineWidthTextField / 2),
          ),
          focusedErrorBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(radius8)),
            borderSide: BorderSide(
              color: AppColor.error,
              width: errorOutlineWidthTextField,
            ),
          ),
        ),
      );
}
