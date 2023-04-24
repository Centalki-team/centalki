import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/text.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';
import '../blocs/vocab_learning_bloc/vocab_learning_bloc.dart';
import '../widgets/vocab_flash_card.dart';
import 'vocab_learning_congrats_view.dart';

class VocabLearningView extends StatefulWidget {
  const VocabLearningView({
    super.key,
    required this.vocabsList,
  });

  final List<BookmarkVocabsItemEntity> vocabsList;

  @override
  State<VocabLearningView> createState() => _VocabLearningViewState();
}

class _VocabLearningViewState extends State<VocabLearningView>
    with SingleTickerProviderStateMixin {
  bool allowPop = true;
  late ValueNotifier<int> _currentTabIndex;
  late TabController _tabController;

  _showEndProgressOptionalDialog() async {
    final result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColor.white,
        title: const Text(
          TextDoc.txtEndProgress,
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: AppColor.defaultFont,
            height: 1.0,
          ),
        ),
        content: const Text(
          TextDoc.txtEndProgressContent,
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
              TextDoc.txtCancel,
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
              TextDoc.txtEndBtn,
              style: TextStyle(
                fontSize: labelLargeSize,
                fontWeight: labelLargeWeight,
              ),
            ),
          ),
        ],
      ),
    );
    if (result == true) {
      allowPop = result;
      if (mounted) {
        Navigator.pop(context);
      }
    }
  }

  @override
  void initState() {
    _tabController = TabController(
      length: 5,
      vsync: this,
    );
    _currentTabIndex = ValueNotifier(0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () => Future.value(allowPop),
        child: BlocListener<VocabLearningBloc, VocabLearningState>(
          listener: (context, state) {
            if (state is VocabLearningStartState) {
              if (allowPop) allowPop = false;
              _currentTabIndex.value = 0;
              _tabController.animateTo(_currentTabIndex.value);
            }
          },
          child: Scaffold(
            extendBody: true,
            backgroundColor: AppColor.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: BlocBuilder<VocabLearningBloc, VocabLearningState>(
                builder: (context, state) {
                  if (state is VocabLearningInitState) {
                    return AppBar(
                      leading: IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                        ),
                        onPressed: Navigator.of(context).pop,
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            bottomNavigationBar: SafeArea(
              top: false,
              child: BlocBuilder<VocabLearningBloc, VocabLearningState>(
                builder: (context, state) {
                  if (state is VocabLearningStartState) {
                    return ValueListenableBuilder(
                        valueListenable: _currentTabIndex,
                        builder: (_, value, __) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (value != 4) ...[
                                  AppOutlinedButton(
                                    text: TextDoc.txtEndBtn,
                                    textColor: AppColor.error,
                                    outlineColor: AppColor.error,
                                    minimumSize: const Size(171, 40),
                                    onPressed: _showEndProgressOptionalDialog,
                                  ),
                                  const SizedBox(
                                    height: spacing16,
                                  ),
                                  AppFilledButton(
                                    text: TextDoc.txtNextBtn,
                                    minimumSize: const Size(171, 40),
                                    onPressed: () {
                                      _tabController
                                          .animateTo(++_currentTabIndex.value);
                                    },
                                  ),
                                ] else ...[
                                  AppFilledButton(
                                    text: TextDoc.txtCompleteBtn,
                                    minimumSize: const Size(171, 40),
                                    onPressed: () => context
                                        .read<VocabLearningBloc>()
                                        .add(
                                            const VocabLearningCompleteEvent()),
                                  )
                                ],
                              ],
                            ));
                  } else if (state is VocabLearningCongratState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          TextDoc.txtStillWantToLearnMore,
                          style: TextStyle(
                            fontSize: bodyMediumSize,
                            fontWeight: bodyMediumWeight,
                            color: AppColor.shadow,
                            height: 20 / 22,
                          ),
                        ),
                        const SizedBox(
                          height: spacing8,
                        ),
                        AppElevatedButton(
                          text: TextDoc.txtOfCourse,
                          minimumSize: const Size(171, 40),
                          onPressed: () =>
                              context.read<VocabLearningBloc>().add(
                                    VocabLearningStartEvent(
                                      vocabsList: widget.vocabsList,
                                    ),
                                  ),
                        ),
                        const SizedBox(
                          height: spacing16,
                        ),
                        AppTextButton(
                          text: TextDoc.txtThatEnoughForToday,
                          minimumSize: const Size(171, 40),
                          onPressed: Navigator.of(context).pop,
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            body: BlocBuilder<VocabLearningBloc, VocabLearningState>(
              buildWhen: (previous, current) =>
                  current is VocabLearningInitState ||
                  current is VocabLearningStartState ||
                  current is VocabLearningCongratState,
              builder: (context, state) {
                if (state is VocabLearningInitState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: spacing28,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'You will be presented with up to ',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: bodySmallWeight,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: '5 random',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: ' phrases in your vocabulary list that ',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: bodySmallWeight,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: 'you saved.\n\n',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'For each one, you will learn its meaning and example simply by ',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: bodySmallWeight,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: 'touching the flashcard',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyle(
                                  fontSize: bodySmallSize,
                                  fontWeight: bodySmallWeight,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(
                        height: 72.0,
                      ),
                      AppElevatedButton(
                        onPressed: () => context.read<VocabLearningBloc>().add(
                              VocabLearningStartEvent(
                                vocabsList: widget.vocabsList,
                              ),
                            ),
                        text: TextDoc.txtStartBtn,
                        minimumSize: const Size(171, 40),
                      )
                    ],
                  );
                } else if (state is VocabLearningStartState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 300,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: state.vocabsList
                              .map(
                                (e) => VocabFlashCard(
                                  bookmarkVocabsItemEntity: e,
                                  //currentTabIndex: _currentTabIndex,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(
                        height: spacing16,
                      ),
                      ValueListenableBuilder(
                        valueListenable: _currentTabIndex,
                        builder: (_, value, __) => Text(
                          '${_currentTabIndex.value + 1}/5',
                          style: const TextStyle(
                            fontSize: titleLargeSize,
                            fontWeight: titleLargeWeight,
                            color: AppColor.shadow,
                            height: 28 / 30,
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is VocabLearningCongratState) {
                  return VocabLearningCongratsView(
                    onLearnMore: () => context.read<VocabLearningBloc>().add(
                          VocabLearningStartEvent(
                            vocabsList: widget.vocabsList,
                          ),
                        ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ),
      );
}
