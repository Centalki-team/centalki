import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/widgets/internal_page.dart';
import '../blocs/topic_level_bloc/topic_level_bloc.dart';
import '../blocs/topics_bloc/topics_bloc.dart';
import '../widgets/topic_card.dart';

class SelectTopicLevelView extends StatefulWidget {
  const SelectTopicLevelView({Key? key}) : super(key: key);

  @override
  State<SelectTopicLevelView> createState() => _SelectTopicLevelViewState();
}

class _SelectTopicLevelViewState extends State<SelectTopicLevelView> with SingleTickerProviderStateMixin {
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
    return BlocListener<TopicLevelBloc, TopicLevelState>(
      listener: (context, state) {
        if (state is TopicLevelChangeTabState) {
          _tabController.index = state.currentTab;
        }
      },
      listenWhen: (previous, current) =>
          previous is TopicLevelChangeTabState &&
          current is TopicLevelChangeTabState &&
          previous.currentTab != current.currentTab,
      child: Column(children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          // physics: const NeverScrollableScrollPhysics(),
          onTap: (index) {
            context.read<TopicLevelBloc>().add(TopicLevelChangeTabEvent(desTab: index));
          },
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
        BlocBuilder<TopicLevelBloc, TopicLevelState>(
          buildWhen: (previous, current) => current is TopicLevelChangeTabState,
          builder: (context, state) {
            if (state is TopicLevelChangeTabState) {
              return Expanded(
                child: TabBarView(
                  controller: _tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    BlocBuilder<TopicsBloc, TopicsState>(
                      builder: (context, state) {
                        if (state is TopicsLoadDoneState) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: screenAutoPadding16),
                            child: ListView.separated(
                              padding: const EdgeInsets.only(top: 16),
                              itemCount: state.topics.topics!.length,
                              separatorBuilder: (context, index) => const SizedBox(height: smallSpacing8),
                              itemBuilder: (context, index) {
                                return TopicCard(
                                  item: state.topics.topics![index],
                                );
                              },
                            ),
                          );
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    ),
                    const Center(
                      child: Text('Intermediate Tab'),
                    ),
                    const Center(
                      child: Text('Upper-Intermediate Tab'),
                    ),
                  ],
                ),
              );
            }
            return const InternalPage(title: 'Select Topic Level');
          },
        ),
      ]),
    );
  }
}
