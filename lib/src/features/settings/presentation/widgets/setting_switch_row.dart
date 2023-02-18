import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingSwitchRow extends StatefulWidget {
  const SettingSwitchRow({
    super.key,
    required this.title,
    this.initialValue = false,
    this.onChanged,
  });

  final String title;
  final bool initialValue;
  final Function(bool)? onChanged;

  @override
  State<SettingSwitchRow> createState() => _SettingSwitchRowState();
}

class _SettingSwitchRowState extends State<SettingSwitchRow> {
  late bool currentValue;

  @override
  void initState() {
    super.initState();
    currentValue = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 32.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  letterSpacing: 0.15,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CupertinoSwitch(
              activeColor: const Color(0xFFFFD033),
              thumbColor: currentValue ? Colors.white : const Color(0xFF9D9DAD),
              trackColor: const Color(0xFFE6E6EA),
              value: currentValue,
              onChanged: (value) {
                widget.onChanged?.call(value);
                setState(() {
                  currentValue = value;
                });
              },
            ),
          ],
        ),
      );
}
