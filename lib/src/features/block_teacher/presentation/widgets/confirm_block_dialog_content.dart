import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/buttons/button.dart';

class ConfirmToBlockDialogContent extends StatelessWidget {
  const ConfirmToBlockDialogContent({super.key, required this.blockCallback});

  final Function() blockCallback;

  @override
  Widget build(BuildContext context) => AlertDialog(
        backgroundColor: colorsByTheme(context).backgroundCardsChip,
        title: Text(
          TextDoc.txtQuestionBlockTeacher,
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1,
          ),
        ),
        content: Text(
          TextDoc.txtBlockTeacherDesc,
          style: TextStyle(
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            color: colorsByTheme(context).defaultFont,
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
            text: TextDoc.txtBlock,
            onPressed: blockCallback,
          ),
        ],
      );
}
