import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';

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
        title: Text(title),
        content: Text(content),
        actions: actions,
      );
}
