import 'package:flutter/material.dart';

import '../../define/styles.dart';
import '../buttons/button.dart';

class ErrorDialogContent extends StatelessWidget {
  const ErrorDialogContent({
    Key? key,
    required this.title,
    this.content,
  }) : super(key: key);

  final String title;
  final String? content;

  @override
  Widget build(BuildContext context) => AlertDialog(
        icon: const Icon(
          Icons.error_outline,
          color: AppColor.error,
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
            text: TextDoc.txtOk,
          ),
        ],
      );
}
