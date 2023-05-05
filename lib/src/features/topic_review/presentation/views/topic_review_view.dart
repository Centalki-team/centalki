import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../../domain/entities/topic_feedback_data_entity.dart';
import '../blocs/topic_review_bloc/topic_review_bloc.dart';
import 'topic_feedback_single_pageview.dart';

class TopicReviewContent extends StatefulWidget {
  const TopicReviewContent({
    super.key,
    required this.topicId,
  });

  final String topicId;

  @override
  State<TopicReviewContent> createState() => _TopicReviewContentState();
}

class _TopicReviewContentState extends State<TopicReviewContent>
    with SingleTickerProviderStateMixin {
  late ValueNotifier<int> currentTabIndex;
  late ValueNotifier<TopicFeedbackDataEntity> topicFeedbackData;
  late TabController _tabController;
  bool allowPop = false;

  _showExitOptionDialog() async {
    final res = await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColor.white,
              title: const Text(
                TextDoc.txtNotFinishFeedback,
                style: TextStyle(
                  fontSize: titleLargeSize,
                  fontWeight: titleLargeWeight,
                  color: AppColor.defaultFont,
                  height: 28 / 30,
                ),
              ),
              content: const Text(
                TextDoc.txtNotFinishFeedbackContent,
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.defaultFont,
                  height: 1.0,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.mainColor1,
                  ),
                  child: const Text(
                    TextDoc.txtStayBtn,
                    style: TextStyle(
                      fontSize: labelLargeSize,
                      fontWeight: labelLargeWeight,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context, true),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.error,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    TextDoc.txtExitBtn,
                    style: TextStyle(
                      fontSize: labelLargeSize,
                      fontWeight: labelLargeWeight,
                    ),
                  ),
                ),
              ],
            ));
    allowPop = res;
    if (allowPop) {
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  _showSuccessDialog() async {
    await showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: AppColor.white,
              title: const Text(
                TextDoc.txtFeedbackSuccess,
                style: TextStyle(
                  fontSize: titleLargeSize,
                  fontWeight: titleLargeWeight,
                  color: AppColor.defaultFont,
                  height: 28 / 30,
                ),
              ),
              content: const Text(
                TextDoc.txtFeedbackSuccessContent,
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.defaultFont,
                  height: 1.0,
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColor.mainColor1,
                  ),
                  child: const Text(
                    TextDoc.txtOk,
                    style: TextStyle(
                      fontSize: labelLargeSize,
                      fontWeight: labelLargeWeight,
                    ),
                  ),
                ),
                // ElevatedButton(
                //   onPressed: () => Navigator.pop(context, true),
                //   style: ElevatedButton.styleFrom(
                //     backgroundColor: AppColor.error,
                //     foregroundColor: Colors.white,
                //   ),
                //   child: const Text(
                //     TextDoc.txtExitBtn,
                //     style: TextStyle(
                //       fontSize: labelLargeSize,
                //       fontWeight: labelLargeWeight,
                //     ),
                //   ),
                // ),
              ],
            ));
    allowPop = true;
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void initState() {
    topicFeedbackData = ValueNotifier(TopicFeedbackDataEntity(
      topicId: widget.topicId,
      nameFb: [],
      picFb: [],
      descriptionFb: [],
      vocabFb: [],
      qnaFb: [],
    ));
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    currentTabIndex = ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(allowPop),
        child: BlocListener<TopicReviewBloc, TopicReviewState>(
          listener: (context, state) {
            if (state is TopicReviewSendFeedbackDoneState) {
              _showSuccessDialog();
            } else if (state is TopicReviewErrorState) {
              AppToast(
                mode: AppToastMode.error,
                duration: const Duration(seconds: 3),
                bottomOffset: 8.0,
                message: Text(
                  state.exception.displayMessage,
                  style: const TextStyle(
                    fontSize: bodyLargeSize,
                    fontWeight: bodyLargeWeight,
                    color: AppColor.white,
                  ),
                ),
              ).show(context);
            } else if (state is TopicReviewLoadingState) {
              LoadingManager.setLoading(
                context,
                loading: state.showLoading,
              );
            }
          },
          child: Scaffold(
            backgroundColor: AppColor.white,
            bottomNavigationBar: SafeArea(
              top: false,
              child: BlocBuilder<TopicReviewBloc, TopicReviewState>(
                  buildWhen: (previous, current) =>
                      current is TopicReviewOptionsLoadedState,
                  builder: (context, state) {
                    if (state is TopicReviewOptionsLoadedState) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: spacing16,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ValueListenableBuilder(
                              valueListenable: currentTabIndex,
                              builder: (_, value, __) => value > 0
                                  ? AppTextButton(
                                      text: TextDoc.txtBackBtn,
                                      minimumSize: const Size(104, 40),
                                      onPressed: () => _tabController
                                          .animateTo(--currentTabIndex.value),
                                    )
                                  : const SizedBox(
                                      height: 40,
                                      width: 104,
                                    ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: currentTabIndex,
                              builder: (_, value, __) => Text(
                                '${value + 1} of 5',
                                style: const TextStyle(
                                  fontSize: labelLargeSize,
                                  fontWeight: labelLargeWeight,
                                  color: AppColor.shadow,
                                ),
                              ),
                            ),
                            ValueListenableBuilder(
                              valueListenable: currentTabIndex,
                              builder: (_, value, __) => value == 4
                                  ? ValueListenableBuilder(
                                      valueListenable: topicFeedbackData,
                                      builder: (_, feedbackData, __) =>
                                          feedbackData.isEmptyData
                                              ? const AppElevatedButton(
                                                  text: TextDoc.txtSend,
                                                  minimumSize: Size(104, 40),
                                                )
                                              : AppElevatedButton(
                                                  text: TextDoc.txtSend,
                                                  minimumSize:
                                                      const Size(104, 40),
                                                  onPressed: () => context
                                                      .read<TopicReviewBloc>()
                                                      .add(
                                                          TopicReviewSendFeedbackEvent(
                                                        topicFeedbackDataEntity:
                                                            feedbackData,
                                                      )),
                                                ),
                                    )
                                  : AppFilledButton(
                                      text: TextDoc.txtNextBtn,
                                      minimumSize: const Size(104, 40),
                                      onPressed: () => _tabController
                                          .animateTo(++currentTabIndex.value),
                                    ),
                            ),
                          ],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  }),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top + spacing20,
                    bottom: spacing20,
                    left: spacing16,
                  ),
                  child: GestureDetector(
                    onTap: _showExitOptionDialog,
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24.0,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: spacing24,
                    bottom: spacing16,
                  ),
                  child: Text(
                    TextDoc.txtTopicFeedback,
                    style: TextStyle(
                      fontSize: headlineSmallSize,
                      fontWeight: headlineSmallWeight,
                      color: AppColor.defaultFont,
                      height: 32 / 34,
                    ),
                  ),
                ),
                Expanded(
                  child: BlocBuilder<TopicReviewBloc, TopicReviewState>(
                    buildWhen: (previous, current) =>
                        current is TopicReviewOptionsLoadedState,
                    builder: (context, state) {
                      if (state is TopicReviewOptionsLoadedState) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: padding16,
                            vertical: padding24,
                          ),
                          child: TabBarView(
                            controller: _tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              TopicFeedbackSinglePageView(
                                title: 'Topic\'s Name',
                                topicFeedbackOptions:
                                    state.topicFeedbackOptionsEntity.topicName,
                                selectionList: topicFeedbackData.value.nameFb,
                                hint:
                                    'We appreciate any detailed feedback from you, if possible.',
                                onAdjustSelection: (value) {
                                  topicFeedbackData.value.nameFb.clear();
                                  topicFeedbackData.value.nameFb.addAll(value);
                                },
                                onAdjustDetail: (value) => topicFeedbackData
                                    .value.nameFbDetail = value,
                              ),
                              TopicFeedbackSinglePageView(
                                title: 'Illustration Photo',
                                topicFeedbackOptions:
                                    state.topicFeedbackOptionsEntity.topicPhoto,
                                selectionList: topicFeedbackData.value.picFb,
                                hint:
                                    'We appreciate any detailed feedback from you, if possible.',
                                onAdjustSelection: (value) {
                                  topicFeedbackData.value.picFb.clear();
                                  topicFeedbackData.value.picFb.addAll(value);
                                },
                                onAdjustDetail: (value) =>
                                    topicFeedbackData.value.picFbDetail = value,
                              ),
                              TopicFeedbackSinglePageView(
                                title: 'Topic\'s Description',
                                topicFeedbackOptions: state
                                    .topicFeedbackOptionsEntity
                                    .topicDescription,
                                selectionList:
                                    topicFeedbackData.value.descriptionFb,
                                hint:
                                    'We appreciate any detailed feedback from you, if possible.',
                                onAdjustSelection: (value) {
                                  topicFeedbackData.value.descriptionFb.clear();
                                  topicFeedbackData.value.descriptionFb
                                      .addAll(value);
                                },
                                onAdjustDetail: (value) => topicFeedbackData
                                    .value.descriptionFbDetail = value,
                              ),
                              TopicFeedbackSinglePageView(
                                title: 'Vocabularies',
                                topicFeedbackOptions:
                                    state.topicFeedbackOptionsEntity.topicVocab,
                                selectionList: topicFeedbackData.value.vocabFb,
                                hint:
                                    'We appreciate if you could tell us which phrases and/or examples cause the problems.',
                                maxLines: 5,
                                onAdjustSelection: (value) {
                                  topicFeedbackData.value.vocabFb.clear();
                                  topicFeedbackData.value.vocabFb.addAll(value);
                                },
                                onAdjustDetail: (value) => topicFeedbackData
                                    .value.vocabFbDetail = value,
                              ),
                              TopicFeedbackSinglePageView(
                                title: 'Questions and Answers',
                                topicFeedbackOptions: state
                                    .topicFeedbackOptionsEntity.topicQuestions,
                                selectionList: topicFeedbackData.value.qnaFb,
                                hint:
                                    'We appreciate if you could tell us which questions and/or answers cause the problems.',
                                maxLines: 5,
                                onAdjustSelection: (value) {
                                  topicFeedbackData.value.qnaFb.clear();
                                  topicFeedbackData.value.qnaFb.addAll(value);
                                  setState(() {});
                                },
                                onAdjustDetail: (value) {
                                  topicFeedbackData.value.qnaFbDetail = value;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
