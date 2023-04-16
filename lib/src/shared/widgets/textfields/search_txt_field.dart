import 'package:flutter/material.dart';

import '../../../../base/define/colors.dart';
import '../../../../base/define/dimensions.dart';
import '../../../../base/define/opacity.dart';
import '../../../../base/define/size.dart';
import '../../../../base/define/text.dart';
import '../../../../base/define/width.dart';

class SearchTextField extends StatefulWidget {
  const SearchTextField({
    Key? key,
    this.focusNode,
    required this.controller,
    required this.hintText,
    this.onSubmitted,
  }) : super(key: key);

  final FocusNode? focusNode;
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onSubmitted;

  @override
  State<SearchTextField> createState() => _SearchTextFieldState();
}

class _SearchTextFieldState extends State<SearchTextField> {
  late final FocusNode _focusNode;
  bool highlightClear = false;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() => setState(() {
          highlightClear = _focusNode.hasFocus;
        }));
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _focusNode.requestFocus();
    });
  }

  @override
  void didUpdateWidget(covariant SearchTextField oldWidget) {
    widget.controller.text = oldWidget.controller.text;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.removeListener(() {});
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: widget.controller.text.length > 100
                    ? AppColor.error
                    : AppColor.mainColor2,
              ),
        ),
        child: TextField(
          focusNode: _focusNode,
          controller: widget.controller,
          cursorColor: AppColor.mainColor2,
          onChanged: (value) {
            setState(() {});
          },
          onSubmitted: (value) {
            setState(() {});
            widget.onSubmitted?.call(value);
          },
          style: const TextStyle(
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            color: AppColor.defaultFont,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(height: 1),
            errorText: widget.controller.text.length > 100
                ? TextDoc.txtSearchError
                : null,
            errorMaxLines: 2,
            errorStyle: const TextStyle(
              fontSize: bodySmallSize,
              fontWeight: bodySmallWeight,
              color: AppColor.error,
            ),
            prefixIcon: const Icon(Icons.search_rounded, size: 24),
            prefixIconColor: AppColor.shadow,
            suffixIcon: widget.controller.text.isNotEmpty
                ? IconButton(
                    icon: Icon(
                      Icons.clear_rounded,
                      color: widget.controller.text.length > 100
                          ? AppColor.error
                          : highlightClear
                              ? AppColor.mainColor2
                              : AppColor.container,
                    ),
                    onPressed: () {
                      widget.controller.clear();
                      widget.onSubmitted?.call('');
                      setState(() {});
                      if (!_focusNode.hasFocus) {
                        _focusNode.requestFocus();
                      }
                    })
                : null,
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
        ),
      );
}
