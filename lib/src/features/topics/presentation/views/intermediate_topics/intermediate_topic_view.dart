import 'package:flutter/material.dart';

class IntermediateTopicView extends StatefulWidget {
  const IntermediateTopicView({Key? key}) : super(key: key);

  @override
  State<IntermediateTopicView> createState() => _IntermediateTopicViewState();
}

class _IntermediateTopicViewState extends State<IntermediateTopicView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Intermediate Topic(s) Goes Here\nWorks In Progress...',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
