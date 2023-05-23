import 'package:flutter/material.dart';

import '../../../../base/define/colors.dart';
import '../../../../base/define/size.dart';
import '../../../../base/define/text.dart';
import '../../../../base/define/theme.dart';

class ConfirmPopup extends StatelessWidget {
  const ConfirmPopup({
    super.key,
    required this.title,
    required this.content,
    this.declineBtnTitle = TextDoc.txtCancel,
    required this.confirmBtnTitle,
  });

  final String title;
  final String content;
  final String declineBtnTitle;
  final String confirmBtnTitle;

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: colorsByTheme(context).backgroundCardsChip,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: titleLargeSize,
            fontWeight: titleLargeWeight,
            color: AppColor.error,
          ),
        ),
        content: Text(
          content,
          style: TextStyle(
            fontSize: bodySmallSize,
            fontWeight: bodySmallWeight,
            color: colorsByTheme(context).defaultFont,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            style: TextButton.styleFrom(
              foregroundColor: AppColor.mainColor1,
            ),
            child: Text(
              declineBtnTitle,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.error,
              foregroundColor: Colors.white,
            ),
            child: Text(
              confirmBtnTitle,
              style: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
        ],
      );
}
