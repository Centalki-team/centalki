import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/button.dart';

class ConfirmToBlockDialogContent extends StatelessWidget {
  const ConfirmToBlockDialogContent({super.key, required this.blockCallback});

  final Function() blockCallback;

  @override
  Widget build(BuildContext context) => AlertDialog(
        title: const Text(
          "Block Teacher?",
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: AppColor.defaultFont,
            height: 1,
          ),
        ),
        content: const Text(
          "If you believe this teacher's behavior was disrespectful and unethical, you can block them permanently to have better overall experiences.\nHowever, this action cannot be undone, and you will have fewer choices for your future sessions.",
          style: TextStyle(
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            color: AppColor.defaultFont,
            height: 1,
          ),
        ),
        actions: [
          AppTextButton(
            text: TextDoc.txtCancel,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          AppFilledButton(
            text: "Block",
            onPressed: blockCallback,
          ),
        ],
      );
}
