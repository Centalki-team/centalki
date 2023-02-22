import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../base/widgets/internal_page.dart';
import '../../blocs/topic_level_bloc/topic_level_bloc.dart';
import '../intermediate_topics/intermediate_topic_page.dart';
import '../pre_intermediate_topics/pre_intermediate_topic_page.dart';
import '../upper_intermediate_topics/upper_intermediate_topic_page.dart';

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
  Widget build(BuildContext context) => BlocListener<TopicLevelBloc, TopicLevelState>(
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
          tabs: const [
            Tab(
              child: Text(
                TextDoc.txtPreIntermediate,
                style: TextStyle(color: AppColor.mainColor1),
              ),
            ),
            Tab(
              child: Text(
                TextDoc.txtIntermediate,
                style: TextStyle(color: AppColor.mainColor1),
              ),
            ),
            Tab(
              child: Text(
                TextDoc.txtUpperIntermediate,
                style: TextStyle(color: AppColor.mainColor1),
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
                  children: const [
                    PreIntermediateTopicPage(),
                    IntermediateTopicPage(),
                    UpperIntermediateTopicPage(),
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
