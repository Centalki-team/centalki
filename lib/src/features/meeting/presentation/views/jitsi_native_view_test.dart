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
    with SingleTickerProviderStateMixin {
  CustomJitsiNativeViewController? _controller;
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          // ElevatedButton(
          //   onPressed: () {
          //     _controller?.join();
          //   },
          //   child: const Text('Join'),
          // ),
          // ElevatedButton(
          //   onPressed: () {
          //     _controller?.hangUp();
          //   },
          //   child: const Text('hangup'),
          // ),
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: CustomJitsiNativeView(
              options: widget.options,
              onViewCreated: (controller) {
                _controller = controller;
                _controller?.attachListener(widget.listener);
              },
            ),
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
