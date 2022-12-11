import 'package:centalki/base/define/common_txt_style.dart';
import 'package:flutter/material.dart';

class InternalPage extends StatelessWidget {
  const InternalPage({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Material(
        child: Center(
          child: Text(
            title,
            style: CommonTxtStyle.t16Medium,
          ),
        ),
      );
}
