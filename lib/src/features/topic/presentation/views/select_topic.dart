import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:flutter/material.dart';

import '../widgets/topic_card.dart';

class SelectTopicView extends StatefulWidget {
  const SelectTopicView({Key? key}) : super(key: key);

  @override
  State<SelectTopicView> createState() => _SelectTopicViewState();
}

class _SelectTopicViewState extends State<SelectTopicView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            controller: _tabController,
            isScrollable: true,
            physics: const NeverScrollableScrollPhysics(),
            tabs: [
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
              Tab(
                child: Text(
                  'Upper-Intermediate',
                  style: TextStyle(color: colorScheme.primary),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
                controller: _tabController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Padding(
                    padding: const EdgeInsets.all(screenAutoPadding16),
                    child: ListView.separated(
                      itemCount: 10,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: smallSpacing8),
                      itemBuilder: (context, index) => const TopicCard(),
                    ),
                  ),
                  const Center(
                    child: Text('Intermediate Tab'),
                  ),
                  const Center(
                    child: Text('Upper-Intermediate Tab'),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
