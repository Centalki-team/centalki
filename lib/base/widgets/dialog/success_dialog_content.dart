import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';
import '../../define/styles.dart';
import '../buttons/button.dart';

class SuccessDialogContent extends StatelessWidget {
  const SuccessDialogContent({
    Key? key,
    required this.title,
    this.content,
  }) : super(key: key);

  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) => AlertDialog(
        icon: const Icon(
          Icons.check,
          color: AppColor.support,
          size: 48,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: titleMediumSize,
          ),
        ),
        content: content != null
            ? Text(
                content!,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                ),
              )
            : null,
        actions: [
          AppTextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: S.current.txtOk,
          ),
        ],
      );
}
