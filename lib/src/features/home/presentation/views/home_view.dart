import 'package:flutter/material.dart';

import '../../../../../base/define/app_text.dart';
import '../../../../../base/define/styles.dart';
import '../../../../../base/widgets/bottom_bar/custom_bottom_nav.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../account/presentation/views/your_account/your_account_page.dart';
import '../../../favorites/presentation/views/favorite_view.dart';
import '../../../settings/presentation/views/settings_view.dart';
import '../../../topics/presentation/views/select_topic_level/select_topic_level_view.dart';
import '../widgets/custom_bot_nav_bar_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  ValueNotifier<int> currentIndex = ValueNotifier(0);
  late final TabController _tabController;
  final bottomNavList = <BottomIndicatorNavigationBarItem>[];

  @override
  void initState() {
    _tabController = TabController(
      length: 4,
      initialIndex: 0,
      vsync: this,
      animationDuration: const Duration(milliseconds: 300),
    );
    super.initState();
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
            //             color: AppColor.defaultFont,
            //           ),
            //         ),
            //       ),
            //       // const SizedBox(
            //       //   width: 24.0,
            //       // ),
            //       // Padding(
            //       //   padding: const EdgeInsets.symmetric(
            //       //     horizontal: 12.0,
            //       //   ),
            //       //   child: Assets.icon.icSearchHeader.svg(),
            //       // ),
            //       // Padding(
            //       //   padding: const EdgeInsets.symmetric(
            //       //     horizontal: 12.0,
            //       //   ),
            //       //   child: Assets.icon.icNotiHeader.svg(),
            //       // ),
            //     ],
            //   ),
            // ),
            Expanded(
              child: TabBarView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: const [
                  SelectTopicLevelView(),
                  FavoriteView(),
                  YourAccountPage(),
                  SettingsView(),
                ],
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BottomIndicatorBar(
        //   currentIndex: currentIndex,
        //   onTap: (value) {
        //     currentIndex = value;
        //     _tabController.animateTo(value);
        //   },
        //   items: [
        //     BottomIndicatorNavigationBarItem(
        //       iconName: Assets.icon.list.path,
        //       title: AppText.topic,
        //     ),
        //     BottomIndicatorNavigationBarItem(
        //       iconName: Assets.icon.favorite.path,
        //       title: AppText.favorite,
        //     ),
        //     BottomIndicatorNavigationBarItem(
        //       iconName: Assets.icon.account.path,
        //       title: AppText.account,
        //     ),
        //     BottomIndicatorNavigationBarItem(
        //       iconName: Assets.icon.settings.path,
        //       title: AppText.settings,
        //     ),
        //   ],
        // ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.withOpacity(0.5),
                blurRadius: 8.0,
              )
            ],
          ),
          child: ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (_, value, __) => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: value,
              backgroundColor: Colors.white,
              onTap: (newValue) {
                currentIndex.value = newValue;
                _tabController.animateTo(newValue);
              },
              selectedItemColor: AppColor.mainColor1,
              selectedLabelStyle: const TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
              unselectedItemColor: AppColor.shadow,
              unselectedLabelStyle: const TextStyle(
                fontSize: bodyMediumSize,
                fontWeight: bodyMediumWeight,
              ),
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Assets.icon.dashboard.image(
                    width: 24.0,
                    height: 24,
                  ),
                  activeIcon: Assets.icon.dashboardFilled.image(
                    width: 24.0,
                    height: 24,
                    color: AppColor.mainColor1,
                  ),
                  label: AppText.topic,
                ),
                BottomNavigationBarItem(
                  icon: Assets.icon.favorite.image(
                    width: 24.0,
                    height: 24,
                  ),
                  activeIcon: Assets.icon.wishlistFilled.image(
                      width: 24.0, height: 24, color: AppColor.mainColor1),
                  label: AppText.favorite,
                ),
                BottomNavigationBarItem(
                  icon: Assets.icon.account.image(
                    width: 24.0,
                    height: 24,
                  ),
                  activeIcon: Assets.icon.accountFilled.image(
                      width: 24.0, height: 24, color: AppColor.mainColor1),
                  label: AppText.account,
                ),
                BottomNavigationBarItem(
                  icon: Assets.icon.settings.image(
                    width: 24.0,
                    height: 24,
                  ),
                  activeIcon: Assets.icon.settingsFilled.image(
                      width: 24.0, height: 24, color: AppColor.mainColor1),
                  label: AppText.settings,
                ),
              ],
            ),
          ),
        ),
      );
}
