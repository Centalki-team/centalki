import 'package:flutter/material.dart';

import '../../../../../base/define/text.dart';
import '../../domain/entities/user_account_entity.dart';

class GenderRadioButtonGroup extends StatefulWidget {
  const GenderRadioButtonGroup(
      {Key? key, required this.genderCallback, required this.gender})
      : super(key: key);

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
              children: [
                RadioListTile(
                  value: Gender.male,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: const Text(TextDoc.txtMale),
                ),
                RadioListTile(
                  value: Gender.female,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: const Text(TextDoc.txtFemale),
                ),
                RadioListTile(
                  value: Gender.others,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender);
                  },
                  title: const Text(TextDoc.txtOthers),
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
                  title: const Text(TextDoc.txtMale),
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
                  title: const Text(TextDoc.txtFemale),
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
                  title: const Text(TextDoc.txtOthers),
                ),
              ),
            ],
          );
        },
      );
}
