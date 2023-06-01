import 'package:flutter/material.dart';

import '../../../../../../base/define/colors.dart';
import '../../../../../../base/define/common_txt_style.dart';
import '../../../../../../base/define/dimensions.dart';
import '../../../../../../base/define/size.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../shared/widgets/tab_indicator/tab_indicator.dart';
import '../../../../notifications/presentation/views/noti_list_page.dart';
import '../../../../search_topics/presentation/views/search_topics_page.dart';
import '../../../../topic_suggestion/presentation/views/topic_suggestion_page.dart';
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
  Widget build(BuildContext context) => Scaffold(
        //backgroundColor: AppColor.white,
        appBar: AppBar(
          //backgroundColor: AppColor.white,
          title: Text(
            S.current.appName,
            style: CommonTxtStyle.t30Regular.apply(
              color: colorsByTheme(context).defaultFont,
            ),
          ),
          centerTitle: false,
          actions: [
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const TopicSuggestionPage(),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(padding12),
                child: Icon(
                  Icons.lightbulb_outline_rounded,
                  size: 24.0,
                  color: AppColor.mainColor1,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SearchTopicsPage(),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(padding12),
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
              child: const Padding(
                padding: EdgeInsets.all(padding12),
                child: Icon(
                  Icons.notifications_none_rounded,
                  color: AppColor.mainColor1,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // SizedBox(
            //   height: MediaQuery.of(context).padding.top,
            // ),
            // Container(
            //   height: 64.0,
            //   padding: const EdgeInsets.only(
            //     left: 16.0,
            //     right: 4.0,
            //   ),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: Text(
            //           AppText.appName,
            //           style: CommonTxtStyle.t30Regular.apply(
            //             color: colorsByTheme(context).defaultFont,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(
            //         width: 24.0,
            //       ),
            //       GestureDetector(
            //         onTap: () => Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => const SearchTopicsPage(),
            //           ),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 12.0,
            //           ),
            //           child: Assets.icon.icSearchHeader.svg(),
            //         ),
            //       ),
            //       GestureDetector(
            //         onTap: () => Navigator.push(
            //           context,
            //           MaterialPageRoute(
            //             builder: (context) => const NotiListPage(),
            //           ),
            //         ),
            //         child: Padding(
            //           padding: const EdgeInsets.symmetric(
            //             horizontal: 12.0,
            //           ),
            //           child: Assets.icon.icNotiHeader.svg(),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            TabBar(
              indicator: CircleTabIndicator(
                color: AppColor.secondary,
                radius: 4.0,
              ),
              indicatorColor: AppColor.secondary,
              labelColor: AppColor.secondary,
              unselectedLabelColor: colorsByTheme(context).tabTitleColor,
              controller: _tabController,
              isScrollable: true,
              // physics: const NeverScrollableScrollPhysics(),
              onTap: (index) {
                currentIndex = index;
                _tabController.animateTo(index);
              },
              tabs: [
                // Tab(
                //   child: Text(
                //     S.current.txtElementary,
                //     style: const TextStyle(
                //       fontSize: titleSmallSize,
                //       fontWeight: titleSmallWeight,
                //     ),
                //   ),
                // ),
                Tab(
                  child: Text(
                    S.current.txtPreIntermediate,
                    style: const TextStyle(
                      fontSize: titleSmallSize,
                      fontWeight: titleSmallWeight,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    S.current.txtIntermediate,
                    style: const TextStyle(
                      fontSize: titleSmallSize,
                      fontWeight: titleSmallWeight,
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    S.current.txtUpperIntermediate,
                    style: const TextStyle(
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
                  //ElementaryTopicsPage(),
                  PreIntermediateTopicPage(),
                  IntermediateTopicPage(),
                  UpperIntermediateTopicPage(),
                ],
              ),
            ),
          ],
        ),
      );
}
