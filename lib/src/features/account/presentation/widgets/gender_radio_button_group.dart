import 'package:flutter/material.dart';

class GenderRadioButtonGroup extends StatefulWidget {
  const GenderRadioButtonGroup(
      {Key? key, required this.genderCallback, required this.gender})
      : super(key: key);

  final void Function(String) genderCallback;
  final String gender;

  @override
  State<GenderRadioButtonGroup> createState() => _GenderRadioButtonGroupState();
}

enum Gender { male, female, other }

class _GenderRadioButtonGroupState extends State<GenderRadioButtonGroup> {
  var selectedGender = Gender.male;

  @override
  void initState() {
    selectedGender =
        Gender.values.firstWhere((element) => element.name == widget.gender);
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
                    widget.genderCallback(selectedGender.name);
                  },
                  title: const Text('Male'),
                ),
                RadioListTile(
                  value: Gender.female,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender.name);
                  },
                  title: const Text('Female'),
                ),
                RadioListTile(
                  value: Gender.other,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender.name);
                  },
                  title: const Text('Other'),
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
                    widget.genderCallback(selectedGender.name);
                  },
                  title: const Text('Male'),
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
                    widget.genderCallback(selectedGender.name);
                  },
                  title: const Text('Female'),
                ),
              ),
              Expanded(
                child: RadioListTile(
                  value: Gender.other,
                  groupValue: selectedGender,
                  onChanged: (value) {
                    setState(() {
                      selectedGender = value ?? Gender.male;
                    });
                    widget.genderCallback(selectedGender.name);
                  },
                  title: const Text('Other'),
                ),
              ),
            ],
          );
        },
      );
}
