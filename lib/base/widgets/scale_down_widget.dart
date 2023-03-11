import 'package:flutter/material.dart';

class ScaleDownWidget extends StatelessWidget {
  const ScaleDownWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) => Flexible(
          child: FittedBox(
        fit: BoxFit.scaleDown,
        child: child,
      ));
}
