import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../../generated/l10n.dart';
import '../../../connect_teacher/presentation/views/connect_teacher_page.dart';
import '../../../topic_review/presentation/views/topic_review_page.dart';
import '../../domain/entities/topic_detail_entity.dart';
import '../blocs/topic_detail_bloc/topic_detail_bloc.dart';
import '../widgets/phrase_card.dart';
import '../widgets/question_card.dart';

class TopicDetailView extends StatefulWidget {
  const TopicDetailView({
    Key? key,
    required this.topicId,
  }) : super(key: key);

  final String topicId;

  @override
  State<TopicDetailView> createState() => _TopicDetailViewState();
}

class _TopicDetailViewState extends State<TopicDetailView> {
  _showConfirmRemoveSavedPhrase(TopicPhraseEntity item) async {
    final result = await showDialog(
      //barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: colorsByTheme(context).backgroundCardsChip,
        title: Text(
          S.current.txtConfirmRemoveSavedTitle,
          style: TextStyle(
            fontSize: titleMediumSize,
            fontWeight: titleMediumWeight,
            color: colorsByTheme(context).defaultFont,
            height: 1.0,
          ),
        ),
        content: Text(
          S.current.txtConfirmRemoveSavedContent,
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
              S.current.txtRemove,
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
      if (mounted) {
        context.read<TopicDetailBloc>().add(
            TopicDetailPhraseRemoveBookmarkEvent(
                bookmarkId: item.bookmark!.id!));
      }
    }
  }

  @override
  Widget build(BuildContext context) =>
      BlocListener<TopicDetailBloc, TopicDetailState>(
        listener: (context, state) {
          if (state is TopicDetailLoadingState) {
            LoadingManager.setLoading(
              context,
              loading: state.showLoading,
            );
          } else if (state is TopicPhraseCreateBookmarkSuccessState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: const Text(
                'Create bookmark successfully!',
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context.read<TopicDetailBloc>().add(TopicDetailLoadEvent(
                  topicId: widget.topicId,
                ));
          } else if (state is TopicPhraseRemoveBookmarkSuccessState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: const Text(
                'Remove bookmark successfully!',
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context.read<TopicDetailBloc>().add(TopicDetailLoadEvent(
                  topicId: widget.topicId,
                ));
          } else if (state is TopicDetailLoadFailedState) {
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
          } else if (state is TopicPhraseBookmarkAdjustFailedState) {
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
          } else if (state is TopicDetailAddFavoriteDoneState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: Text(
                S.current.txtAddFavoriteSuccess,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<TopicDetailBloc>()
                .add(TopicDetailLoadEvent(topicId: widget.topicId));
          } else if (state is TopicDetailRemoveFavoriteDoneState) {
            AppToast(
              duration: const Duration(seconds: 3),
              bottomOffset: 8.0,
              message: Text(
                S.current.txtRemoveFavoriteSuccess,
                style: const TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: AppColor.white,
                ),
              ),
            ).show(context);
            context
                .read<TopicDetailBloc>()
                .add(TopicDetailLoadEvent(topicId: widget.topicId));
          }
        },
        child: Scaffold(
          //backgroundColor: Colors.white,
          bottomNavigationBar: BlocBuilder<TopicDetailBloc, TopicDetailState>(
            buildWhen: (previous, current) =>
                previous != current && current is TopicDetailLoadDoneState,
            builder: (context, state) {
              if (state is TopicDetailLoadDoneState) {
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    bottom: 24.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: AppElevatedButton(
                          text: S.current.txtTalk,
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConnectTeacherPage(
                                topicId: state.topicDetail.topicId ?? '',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        margin: const EdgeInsets.only(left: spacing8),
                        padding: const EdgeInsets.all(padding8),
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(radius12)),
                          border: Border.all(
                            width:
                                state.topicDetail.bookmark != null ? 2.0 : 1.0,
                            color: state.topicDetail.bookmark != null
                                ? AppColor.error
                                : AppColor.shadow,
                          ),
                        ),
                        child: GestureDetector(
                          onTap: () async {
                            if (state.topicDetail.bookmark != null) {
                              await showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: colorsByTheme(context).backgroundCardsChip,
                                  title: Text(
                                    S.current.txtConfirmRemoveFavoriteTitle,
                                    style: TextStyle(
                                      fontSize: titleLargeSize,
                                      fontWeight: titleLargeWeight,
                                      color: colorsByTheme(context).defaultFont,
                                    ),
                                  ),
                                  content: Text(
                                    S.current.txtConfirmRemoveFavoriteContent,
                                    style: TextStyle(
                                      fontSize: bodySmallSize,
                                      fontWeight: bodySmallWeight,
                                      color: colorsByTheme(context).defaultFont,
                                    ),
                                  ),
                                  actions: [
                                    AppTextButton(
                                      text: S.current.txtCancel,
                                      onPressed: () =>
                                          Navigator.pop(context, false),
                                    ),
                                    ElevatedButton(
                                      onPressed: () =>
                                          Navigator.pop(context, true),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.error,
                                        foregroundColor: Colors.white,
                                      ),
                                      child: Text(
                                        S.current.txtRemove,
                                        style: const TextStyle(
                                          fontSize: labelLargeSize,
                                          fontWeight: labelLargeWeight,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ).then((confirmRemoved) => {
                                    if (confirmRemoved)
                                      {
                                        context
                                            .read<TopicDetailBloc>()
                                            .add(TopicDetailRemoveFavoriteEvent(
                                              id: state.topicDetail.bookmark
                                                      ?.bookmarkId ??
                                                  '',
                                            )),
                                      }
                                  });
                            } else {
                              context
                                  .read<TopicDetailBloc>()
                                  .add(TopicDetailAddFavoriteEvent(
                                    topicId: widget.topicId,
                                  ));
                            }
                          },
                          child: state.topicDetail.bookmark == null
                              ? Assets.icon.icHeart.svg(
                                  color: AppColor.shadow,
                                )
                              : Assets.icon.icHeartFill.svg(
                                  color: AppColor.error,
                                ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TopicReviewPage(
                              topicId: widget.topicId,
                            ),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: padding8,
                          ),
                          padding: const EdgeInsets.all(padding8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            border: Border.all(
                              color: AppColor.shadow,
                            ),
                          ),
                          child: const Icon(
                            Icons.feedback_outlined,
                            color: AppColor.shadow,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }
              return const SizedBox.shrink();
            },
          ),
          body: BlocBuilder<TopicDetailBloc, TopicDetailState>(
            buildWhen: (previous, current) =>
                previous != current && (current is TopicDetailLoadDoneState),
            builder: (context, state) {
              if (state is TopicDetailLoadDoneState) {
                return Stack(
                  children: [
                    Container(
                      height: 144.0 + MediaQuery.of(context).padding.top,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            state.topicDetail.topicImage ?? '',
                          ),
                          fit: BoxFit.cover,
                          onError: (_, __) => SizedBox(
                            width: double.infinity,
                            height: 144 + MediaQuery.of(context).padding.top,
                            child: const Icon(
                              Icons.error_outline_rounded,
                              size: 40,
                              color: AppColor.error,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(
                          Icons.arrow_back,
                          color: colorsByTheme(context).defaultFont,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 128.0 + MediaQuery.of(context).padding.top,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: colorsByTheme(context).backgroundTheme,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(24.0),
                            topRight: Radius.circular(24.0),
                          ),
                        ),
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.all(padding16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  state.topicDetail.topicName ??
                                      'null name. Someone must be joking here',
                                  style: const TextStyle(
                                    fontSize: headlineSmallSize,
                                    fontWeight: headlineSmallWeight,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: spacing6),
                              SizedBox(
                                height: 48.0,
                                child: Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            S.current.txtTopicCategory,
                                            style: const TextStyle(
                                              fontSize: labelMediumSize,
                                              fontWeight: labelMediumWeight,
                                              color: AppColor.shadow,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              state.topicDetail.topicCategory ??
                                                  'null. This topic is out of this world',
                                              style: TextStyle(
                                                height: 0.9,
                                                fontSize: bodySmallSize,
                                                fontWeight: bodySmallWeight,
                                                color: colorsByTheme(context)
                                                    .defaultFont,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(width: spacing10),
                                    const DecoratedBox(
                                      decoration: BoxDecoration(
                                        color: AppColor.container,
                                      ),
                                      child: SizedBox(
                                        height: double.infinity,
                                        width: 1.0,
                                      ),
                                    ),
                                    const SizedBox(width: spacing10),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            S.current.txtTopicLevel,
                                            style: const TextStyle(
                                              fontSize: labelMediumSize,
                                              fontWeight: labelMediumWeight,
                                              color: AppColor.shadow,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              state.topicDetail.topicLevel ??
                                                  'null. This topic is for Einstein',
                                              style: TextStyle(
                                                height: 0.9,
                                                fontSize: bodySmallSize,
                                                fontWeight: bodySmallWeight,
                                                color: colorsByTheme(context)
                                                    .defaultFont,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: spacing20),
                              Text(
                                state.topicDetail.topicDescription ??
                                    'null. This topic is about nothing',
                                style: const TextStyle(
                                  height: 1.15,
                                  fontSize: bodyLargeSize,
                                  fontWeight: bodyLargeWeight,
                                ),
                              ),
                              const SizedBox(height: spacing16),
                              Text(
                                S.current.txtTopicVocab,
                                style: const TextStyle(
                                  fontSize: titleLargeSize,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.tertiary,
                                ),
                              ),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0.0),
                                itemCount:
                                    state.topicDetail.topicPhrases?.length ?? 0,
                                itemBuilder: (context, index) {
                                  final phrase =
                                      state.topicDetail.topicPhrases?[index];
                                  if (phrase == null) {
                                    return const Text('Null Phrase');
                                  }
                                  return PhraseCard(
                                    phraseEntity: phrase,
                                    onRemovePhraseBookmark:
                                        _showConfirmRemoveSavedPhrase,
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: spacing20,
                                ),
                              ),
                              const SizedBox(height: spacing16),
                              Text(
                                S.current.txtTopicQuestions,
                                style: const TextStyle(
                                  fontSize: titleLargeSize,
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.tertiary,
                                ),
                              ),
                              const SizedBox(height: spacing8),
                              ListView.separated(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                padding: const EdgeInsets.all(0.0),
                                itemCount:
                                    state.topicDetail.topicQuestions?.length ??
                                        0,
                                itemBuilder: (context, index) {
                                  final questionContent = state.topicDetail
                                      .topicQuestions?[index].questionContent;
                                  final answers = state.topicDetail
                                      .topicQuestions?[index].topicAnswers;
                                  return QuestionCard(
                                    index: index,
                                    questionContent:
                                        questionContent ?? 'null question',
                                    answers: answers ?? [],
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: spacing16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      );
}
