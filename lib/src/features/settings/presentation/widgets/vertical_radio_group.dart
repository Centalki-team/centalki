import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import 'radio_row.dart';

class VerticalRadioGroup extends StatefulWidget {
  const VerticalRadioGroup({
    super.key,
    //required this.title,
    this.initValue,
    this.dataList = const [],
    this.onChanged,
  });

  //final String title;
  final String? initValue;
  final List<String> dataList;
  final Function(dynamic)? onChanged;

  @override
  State<VerticalRadioGroup> createState() => _VerticalRadioGroupState();
}

class _VerticalRadioGroupState extends State<VerticalRadioGroup> {
  late String? currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initValue ?? (widget.dataList.isNotEmpty ? widget.dataList[0] : null);
  }

  @override
  Widget build(BuildContext context) => widget.dataList.isEmpty
      ? const SizedBox.shrink()
      : Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Text(
            //   widget.title,
            //   style: TextStyle(),
            // )
            ...widget.dataList.map(
              (e) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: padding16,
                  vertical: padding4,
                ),
                child: RadioRow(
                  title: e,
                  isSelected: currentValue == e,
                  onSelect: (value) {
                    setState(() {
                      currentValue = value;
                    });
                  },
                ),
              ),
            )
          ],
        );
}
