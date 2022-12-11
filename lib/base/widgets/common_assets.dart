import 'package:flutter/material.dart';

class AssetCommon extends StatelessWidget {
  const AssetCommon({Key? key, required this.name, this.size, this.color})
      : super(key: key);

  final String name;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final iconTheme = IconTheme.of(context);
    return SizedBox(
      width: size ?? iconTheme.size,
      height: size,
      child: Image.asset(
        name,
        color: color,
      ),
    );
  }
}
