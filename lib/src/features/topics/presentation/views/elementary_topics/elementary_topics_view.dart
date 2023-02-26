import 'package:flutter/material.dart';

class ElementaryTopicView extends StatefulWidget {
  const ElementaryTopicView({Key? key}) : super(key: key);

  @override
  State<ElementaryTopicView> createState() => _ElementaryTopicViewState();
}

class _ElementaryTopicViewState extends State<ElementaryTopicView> {
  @override
  Widget build(BuildContext context) => const Center(
        child: Text(
          'Elementary Topic(s) Goes Here\nWorks In Progress...',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 16),
        ),
      );
}
