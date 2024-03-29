import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../generated/l10n.dart';
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

class _VocabLearningViewState extends State<VocabLearningView> with SingleTickerProviderStateMixin {
  bool allowPop = true;
  late ValueNotifier<int> _currentTabIndex;
  late TabController _tabController;

  _showEndProgressOptionalDialog() async {
    final result = await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorsByTheme(context).backgroundCardsChip,
        title: Text(
          S.current.txtEndProgress,
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        content: Text(
          S.current.txtEndProgressContent,
          style: TextStyle(
            fontSize: bodyLargeSize,
            fontWeight: bodyLargeWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            style: TextButton.styleFrom(
              foregroundColor: AppColor.mainColor1,
            ),
            child: Text(
              S.current.txtCancel,
              style: const TextStyle(
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
            child: Text(
              S.current.txtEndBtn,
              style: const TextStyle(
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
            //backgroundColor: AppColor.white,
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: BlocBuilder<VocabLearningBloc, VocabLearningState>(
                builder: (context, state) {
                  if (state is VocabLearningInitState) {
                    return AppBar(
                      leading: IconButton(
                        icon: Icon(
                          Icons.arrow_back,
                          color: colorsByTheme(context).defaultFont,
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
                                  AppFilledButton(
                                    text: S.current.txtNextBtn,
                                    minimumSize: const Size(171, 40),
                                    onPressed: () {
                                      _tabController.animateTo(++_currentTabIndex.value);
                                    },
                                  ),
                                  const SizedBox(
                                    height: spacing16,
                                  ),
                                  AppOutlinedButton(
                                    text: S.current.txtEndBtn,
                                    textColor: AppColor.error,
                                    outlineColor: AppColor.error,
                                    minimumSize: const Size(171, 40),
                                    onPressed: _showEndProgressOptionalDialog,
                                  ),
                                ] else ...[
                                  AppFilledButton(
                                    text: S.current.txtCompleteBtn,
                                    minimumSize: const Size(171, 40),
                                    onPressed: () => context.read<VocabLearningBloc>().add(const VocabLearningCompleteEvent()),
                                  )
                                ],
                              ],
                            ));
                  } else if (state is VocabLearningCongratState) {
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          S.current.txtStillWantToLearnMore,
                          style: const TextStyle(
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
                          text: S.current.txtOfCourse,
                          minimumSize: const Size(171, 40),
                          onPressed: () => context.read<VocabLearningBloc>().add(
                                VocabLearningStartEvent(
                                  vocabsList: widget.vocabsList,
                                ),
                              ),
                        ),
                        const SizedBox(
                          height: spacing16,
                        ),
                        AppTextButton(
                          text: S.current.txtThatEnoughForToday,
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
              buildWhen: (previous, current) => current is VocabLearningInitState || current is VocabLearningStartState || current is VocabLearningCongratState,
              builder: (context, state) {
                if (state is VocabLearningInitState) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.assignment_outlined,
                        size: 64.0,
                        color: AppColor.shadow,
                      ),
                      const SizedBox(
                        height: spacing56,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: spacing28,
                        ),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: S.current.txtYouWillBePresented,
                                style: const TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: bodyMediumWeight,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: S.current.txtRandomPhrases,
                                style: const TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: S.current.txtSavedVocabsList,
                                style: const TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: bodyMediumWeight,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: '${S.current.txtYouSaved}\n\n',
                                style: const TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: S.current.txtForEachOne,
                                style: const TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: bodyMediumWeight,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              TextSpan(
                                text: S.current.txtTouchFlashcard,
                                style: const TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: FontWeight.w700,
                                  color: AppColor.shadow,
                                  height: 16 / 20,
                                ),
                              ),
                              const TextSpan(
                                text: '.',
                                style: TextStyle(
                                  fontSize: bodyMediumSize,
                                  fontWeight: bodyMediumWeight,
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
                        text: S.current.txtStartBtn,
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
