import 'package:flutter/material.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../elementary_topics/elementary_topics_view.dart';
import '../intermediate_topics/intermediate_topic_page.dart';
import '../pre_intermediate_topics/pre_intermediate_topic_page.dart';
import '../upper_intermediate_topics/upper_intermediate_topic_page.dart';

class SelectTopicLevelView extends StatefulWidget {
  const SelectTopicLevelView({Key? key}) : super(key: key);

  @override
  State<SelectTopicLevelView> createState() => _SelectTopicLevelViewState();
}

class _SelectTopicLevelViewState extends State<SelectTopicLevelView>
    with SingleTickerProviderStateMixin {
  late int currentIndex;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    _tabController = TabController(
      length: 4,
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
  Widget build(BuildContext context) => Column(
        children: [
          TabBar(
            indicatorColor: AppColor.secondary,
            labelColor: AppColor.secondary,
            unselectedLabelColor: AppColor.defaultFontContainer,
            controller: _tabController,
            isScrollable: true,
            // physics: const NeverScrollableScrollPhysics(),
            onTap: (index) {
              currentIndex = index;
              _tabController.animateTo(index);
            },
            tabs: const [
              Tab(
                child: Text(
                  TextDoc.txtElementary,
                  style: TextStyle(
                    fontSize: titleSmallSize,
                    fontWeight: titleSmallWeight,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  TextDoc.txtPreIntermediate,
                  style: TextStyle(
                    fontSize: titleSmallSize,
                    fontWeight: titleSmallWeight,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  TextDoc.txtIntermediate,
                  style: TextStyle(
                    fontSize: titleSmallSize,
                    fontWeight: titleSmallWeight,
                  ),
                ),
              ),
              Tab(
                child: Text(
                  TextDoc.txtUpperIntermediate,
                  style: TextStyle(
                    fontSize: titleSmallSize,
                    fontWeight: titleSmallWeight,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                ElementaryTopicView(),
                PreIntermediateTopicPage(),
                IntermediateTopicPage(),
                UpperIntermediateTopicPage(),
              ],
            ),
          ),
        ],
      );
}
