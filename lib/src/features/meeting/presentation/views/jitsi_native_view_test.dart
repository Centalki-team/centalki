import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jitsi_meet_wrapper/jitsi_meet_wrapper.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../generated/l10n.dart';
import '../../../../shared/widgets/tab_indicator/tab_indicator.dart';
import '../blocs/meeting_bloc.dart';
import '../widgets/questions_card_list.dart';
import '../widgets/vocabs_card_list.dart';

class JitsiNativeViewTest extends StatefulWidget {
  const JitsiNativeViewTest({
    super.key,
    required this.options,
    required this.listener,
  });

  final JitsiMeetingOptions options;
  final JitsiMeetingListener listener;

  @override
  State<JitsiNativeViewTest> createState() => _JitsiNativeViewTestState();
}

class _JitsiNativeViewTestState extends State<JitsiNativeViewTest>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  CustomJitsiNativeViewController? _controller;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.detached) {
      log("App kill=======================");
      await _controller?.hangUp();
    }
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              SizedBox(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: CustomJitsiNativeView(
                  options: widget.options,
                  listener: widget.listener,
                  onViewCreated: (controller) {
                    _controller = controller;
                    _controller
                      ?..attachListener(widget.listener)
                      ..join();
                  },
                ),
              ),
              AbsorbPointer(
                child: Container(
                  color: Colors.red.withOpacity(0),
                  width: MediaQuery.of(context).size.width / 5 - 10,
                  height: MediaQuery.of(context).size.width / 5 - 10,
                ),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  await _controller?.hangUp();
                  if (mounted) {
                    context.read<MeetingBloc>().add(
                          MeetingExitRoomEvent(
                            notCompleted: BlocProvider.of<MeetingBloc>(context)
                                .notCompleted,
                          ),
                        );
                  }
                },
                child: Container(
                  color: Colors.red.withOpacity(0),
                  width: MediaQuery.of(context).size.width / 5 - 10,
                  height: MediaQuery.of(context).size.width / 5 - 10,
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                QuestionsCardList(
                  questionsList: BlocProvider.of<MeetingBloc>(context)
                          .session
                          .sessionTopic
                          ?.questions ??
                      [],
                ),
                VocabsCardList(
                  vocabsList: BlocProvider.of<MeetingBloc>(context)
                          .session
                          .sessionTopic
                          ?.phrases ??
                      [],
                ),
              ],
            ),
          ),
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: spacing20,
              ),
              child: TabBar(
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
                onTap: _tabController.animateTo,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          S.current.txtQuestions,
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
            ),
          ),
        ],
      );
}
