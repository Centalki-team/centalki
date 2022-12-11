import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:centalki/base/temp_dio/dio_client.dart';
import 'package:centalki/src/features/topic/domain/entities/topic_item_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/topics_bloc/topics_bloc.dart';
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
                  BlocBuilder<TopicsBloc, TopicsState>(
                    builder: (context, state) {
                      if (state is TopicsLoadDoneState) {
                        return Padding(
                          padding: const EdgeInsets.all(screenAutoPadding16),
                          child: ListView.separated(
                            itemCount: state.topics.topics!.length,
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: smallSpacing8),
                            itemBuilder: (context, index) {
                              print(state.topics.topics![index].topicName);
                              return TopicCard(
                                item: state.topics.topics![index],
                              );
                            },
                          ),
                        );
                      }
                      return const Center(
                        child: Text('No data!'),
                      );
                    },
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
