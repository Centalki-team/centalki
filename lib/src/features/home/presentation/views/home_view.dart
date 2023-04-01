import 'package:flutter/material.dart';

import '../../../../../base/define/app_text.dart';
import '../../../../../base/define/common_txt_style.dart';
import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/bottom_bar/custom_bottom_nav.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../account/presentation/views/your_account/your_account_page.dart';
import '../../../settings/presentation/views/settings_view.dart';
import '../../../topics/presentation/views/select_topic_level/select_topic_level_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late int currentIndex;
  late final TabController _tabController;
  final bottomNavList = <BottomIndicatorNavigationBarItem>[];

  @override
  void initState() {
    super.initState();
    currentIndex = 0;
    _tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: AppColor.white,
        body: Column(
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
                  // const SizedBox(
                  //   width: 24.0,
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 12.0,
                  //   ),
                  //   child: Assets.icon.icSearchHeader.svg(),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //     horizontal: 12.0,
                  //   ),
                  //   child: Assets.icon.icNotiHeader.svg(),
                  // ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  SelectTopicLevelView(),
                  YourAccountPage(),
                  SettingsView(),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomIndicatorBar(
          currentIndex: currentIndex,
          onTap: (value) {
            currentIndex = value;
            _tabController.animateTo(value);
          },
          items: [
            BottomIndicatorNavigationBarItem(
              iconName: Assets.icon.list.path,
              title: AppText.topic,
            ),
            BottomIndicatorNavigationBarItem(
              iconName: Assets.icon.account.path,
              title: AppText.account,
            ),
            BottomIndicatorNavigationBarItem(
              iconName: Assets.icon.settings.path,
              title: AppText.settings,
            ),
          ],
        ),
      );
}
