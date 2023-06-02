import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';

class WarningDialogContent extends StatelessWidget {
  const WarningDialogContent({
    Key? key,
    required this.title,
    required this.content,
    required this.actions,
  }) : super(key: key);

  final String title;
  final String content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => AlertDialog(
        icon: const Icon(
          Icons.warning_amber_outlined,
          color: AppColor.error,
        ),
        title: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: titleLargeSize,
          ),
        ),
        content: Text(
          content,
          style: const TextStyle(
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            height: 1,
          ),
        ),
        actions: actions,
      );
}
