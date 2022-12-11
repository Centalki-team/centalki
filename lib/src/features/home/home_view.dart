import 'package:centalki/base/define/colors.dart';
import 'package:centalki/base/define/common_txt_style.dart';
import 'package:centalki/base/define/dimensions.dart';
import 'package:centalki/base/widgets/internal_page.dart';
import 'package:centalki/src/features/topic/presentation/views/select_topic.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../base/define/app_text.dart';
import '../../../base/widgets/bottom_bar/custom_bottom_nav.dart';
import '../../../gen/assets.gen.dart';
import 'presentation/blocs/home_bloc/home_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  final bottomNavList = <BottomIndicatorNavigationBarItem>[];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 3,
      initialIndex: 0,
      vsync: this,
      animationDuration: Duration.zero,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeChangeTabState) {
          _tabController.index = state.currentTab;
        }
      },
      listenWhen: (previous, current) =>
          previous is HomeChangeTabState &&
          current is HomeChangeTabState &&
          previous.currentTab != current.currentTab,
      child: BlocBuilder<HomeBloc, HomeState>(
        buildWhen: (previous, current) => current is HomeChangeTabState,
        builder: (context, state) {
          if (state is HomeChangeTabState) {
            return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppText.appName,
                            style: CommonTxtStyle.t36XMedium,
                          ),
                          Image.asset(
                            Assets.icon.notifications.path,
                            width: 32,
                            height: 32,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: const [
                          SelectTopicView(),
                          InternalPage(
                            title: 'Account Page',
                          ),
                          InternalPage(
                            title: 'Settings Page',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                bottomNavigationBar: BottomIndicatorBar(
                  currentIndex: state.currentTab,
                  onTap: (index) {
                    context
                        .read<HomeBloc>()
                        .add(HomeChangeTabEvent(desTab: index));
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
              ),
            );
          }
          return const InternalPage(
            title: 'HomePage',
          );
        },
      ),
    );
  }
}
