import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../generated/l10n.dart';
import '../../domain/entities/user_account_entity.dart';

class GenderRadioButtonGroup extends StatefulWidget {
  const GenderRadioButtonGroup({
    Key? key,
    required this.genderCallback,
    required this.gender,
  }) : super(key: key);

  final void Function(Gender) genderCallback;
  final Gender gender;

  @override
  State<GenderRadioButtonGroup> createState() => _GenderRadioButtonGroupState();
}

class _GenderRadioButtonGroupState extends State<GenderRadioButtonGroup> {
  var selectedGender = Gender.male;

  @override
  void initState() {
    selectedGender = widget.gender;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraint) {
          final widthView = constraint.maxWidth;

          if (widthView < 400) {
            return ListView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.all(0.0),
              children: [
                RadioListTile(
                  value: Gender.male,
                  activeColor: AppColor.mainColor2,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: Text(
                    S.current.txtMale,
                    style: TextStyle(
                      fontSize: bodyLargeSize,
                      fontWeight: bodyLargeWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                ),
                RadioListTile(
                  value: Gender.female,
                  activeColor: AppColor.mainColor2,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: Text(
                    S.current.txtFemale,
                    style: TextStyle(
                      fontSize: bodyLargeSize,
                      fontWeight: bodyLargeWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                ),
                RadioListTile(
                  value: Gender.others,
                  activeColor: AppColor.mainColor2,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: Text(
                    S.current.txtOthers,
                    style: TextStyle(
                      fontSize: bodyLargeSize,
                      fontWeight: bodyLargeWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                ),
              ],
            );
          }
          return Row(
            children: [
              Expanded(
                child: RadioListTile(
                  value: Gender.male,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: Text(S.current.txtMale),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: Gender.female,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: Text(S.current.txtFemale),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: Gender.others,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: Text(S.current.txtOthers),
                ),
              ),
            ],
          );
        },
      );
}
