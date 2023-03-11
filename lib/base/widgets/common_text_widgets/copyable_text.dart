import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../define/colors.dart';
import '../../define/icons.dart';
import '../scale_down_widget.dart';

class CopyableText extends StatelessWidget {
  const CopyableText(
      {Key? key,
      required this.label,
      this.style,
      this.onAction,
      this.textAlign,
      this.maxLine,
      this.copyColor,
      this.copySize,
      this.isScaleDown = false})
      : super(key: key);

  final String label;
  final int? maxLine;
  final TextStyle? style;
  final Function? onAction;
  final TextAlign? textAlign;
  final Color? copyColor;
  final double? copySize;
  final bool? isScaleDown;

  @override
  Widget build(BuildContext context) {
    final usedStyle = style ??
        const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
          color: AppColor.defaultFont,
        );
    final fontSize = usedStyle.fontSize;

    return isScaleDown == false
        ? Text.rich(
            TextSpan(children: [
              TextSpan(text: label, style: usedStyle),
              WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 6.0,
                      ),
                      SizedBox(
                        height: fontSize,
                        width: fontSize,
                        child: IconButton(
                          splashRadius: fontSize,
                          padding: EdgeInsets.zero,
                          iconSize: fontSize,
                          onPressed: () => _copyText(context),
                          icon: Icon(
                            AppIcons.copyicon,
                            size: copySize ?? 15,
                            color: copyColor ?? const Color(0xFF1890FF),
                          ),
                        ),
                      ),
                    ],
                  ))
            ]),
            textAlign: textAlign,
            maxLines: maxLine,
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              ScaleDownWidget(
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                  ),
                ),
              ),
              const SizedBox(
                width: 4,
              ),
              GestureDetector(
                child: Icon(
                  AppIcons.copyicon,
                  size: copySize,
                  color: Colors.white,
                ),
                onTap: () => _copyText(context),
              )
            ],
          );
  }

  void _copyText(BuildContext context) {
    if (onAction == null) {
      Clipboard.setData(ClipboardData(text: label));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Đã sao chép: $label"),
          duration: const Duration(milliseconds: 500),
        ),
      );
    } else {
      onAction!();
    }
  }
}
