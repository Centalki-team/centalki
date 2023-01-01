import 'package:flutter/material.dart';

class UpperIntermediateTopicView extends StatefulWidget {
  const UpperIntermediateTopicView({Key? key}) : super(key: key);

  @override
  State<UpperIntermediateTopicView> createState() => _UpperIntermediateTopicViewState();
}

class _UpperIntermediateTopicViewState extends State<UpperIntermediateTopicView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Upper-Intermediate Topic(s) Goes Here\nWorks In Progress...',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
