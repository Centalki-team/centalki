import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:flutter/material.dart';

import '../widgets/topic_card.dart';

class SelectTopicView extends StatefulWidget {
  const SelectTopicView({Key? key}) : super(key: key);

  @override
  State<SelectTopicView> createState() => _SelectTopicViewState();
}

class _SelectTopicViewState extends State<SelectTopicView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CENTALKI'),
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
              isScrollable: true,
              tabs: [
                Tab(
                  child: Text(
                    'Elementary',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                ),
                Tab(
                  child: Text(
                    'Pre-Intermediate',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                ),
                Tab(
                  child: Text(
                    'Intermediate',
                    style: TextStyle(color: colorScheme.primary),
                  ),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                Padding(
                  padding: const EdgeInsets.all(screenAutoPadding16),
                  child: ListView.separated(
                    itemCount: 10,
                    separatorBuilder: (context, index) => const SizedBox(height: smallSpacing8),
                    itemBuilder: (context, index) => const TopicCard(),
                  ),
                ),
                const Center(
                  child: Text('Pre-Intermediate Tab'),
                ),
                const Center(
                  child: Text('Intermediate Tab'),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
