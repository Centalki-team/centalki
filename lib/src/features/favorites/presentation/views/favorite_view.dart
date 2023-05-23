import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/common_txt_style.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/widgets/tab_indicator/tab_indicator.dart';
import '../../../favorite_topics/presentation/views/favorite_topics_page.dart';
import '../../../notifications/presentation/views/noti_list_page.dart';
import '../../../vocabularies/presentation/views/vocabs_page.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView>
    with SingleTickerProviderStateMixin {
  late int currentIndex;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    _tabController = TabController(
      length: 2,
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
                    S.current.appName,
                    style: CommonTxtStyle.t30Regular.apply(
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24.0,
                ),
                // GestureDetector(
                //   onTap: () {},
                //   child: Padding(
                //     padding: const EdgeInsets.symmetric(
                //       horizontal: 12.0,
                //     ),
                //     child: Assets.icon.icSearchHeader.svg(),
                //   ),
                // ),
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
            padding: const EdgeInsets.symmetric(
              horizontal: spacing16,
            ),
            indicator: CircleTabIndicator(
              color: AppColor.secondary,
              radius: 4.0,
            ),
            indicatorColor: AppColor.secondary,
            labelColor: AppColor.secondary,
            unselectedLabelColor: colorsByTheme(context).tabTitleColor,
            controller: _tabController,
            onTap: (index) {
              currentIndex = index;
              _tabController.animateTo(index);
            },
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.current.txtTopicsTab,
                      style: const TextStyle(
                        fontSize: titleSmallSize,
                        fontWeight: titleSmallWeight,
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      S.current.txtVocabsTab,
                      style: const TextStyle(
                        fontSize: titleSmallSize,
                        fontWeight: titleSmallWeight,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: spacing16,
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColor.background,
              ),
              child: SizedBox(
                height: 1.0,
                width: double.infinity,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                // Center(
                //   child: Text(
                //     'Favorite Topic(s) Goes Here\nWorks In Progress...',
                //     textAlign: TextAlign.center,
                //     style: TextStyle(fontSize: 16),
                //   ),
                // ),
                FavoriteTopicsPage(),
                VocabsPage(),
              ],
            ),
          ),
        ],
      );
}
