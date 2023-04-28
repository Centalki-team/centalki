import 'package:flutter/material.dart';

import '../../../../../../base/define/app_text.dart';
import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/common_txt_style.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/text.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../shared/widgets/tab_indicator/tab_indicator.dart';
import '../../../../notifications/presentation/views/noti_list_page.dart';
import '../../../../search_topics/presentation/views/search_topics_page.dart';
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
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Container(
            height: 64.0,
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 4.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    AppText.appName,
                    style: CommonTxtStyle.t30Regular.apply(
                      color: AppColor.defaultFont,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchTopicsPage(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Assets.icon.icSearchHeader.svg(),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotiListPage(),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12.0,
                    ),
                    child: Assets.icon.icNotiHeader.svg(),
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            indicator: CircleTabIndicator(
              color: AppColor.secondary,
              radius: 4.0,
            ),
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
          const DecoratedBox(
            decoration: BoxDecoration(
              color: AppColor.background,
            ),
            child: SizedBox(
              height: 1.0,
              width: double.infinity,
            ),
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
