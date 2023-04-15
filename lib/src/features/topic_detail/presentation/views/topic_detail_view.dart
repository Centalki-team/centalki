import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../base/define/manager/loading_manager.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../../../base/widgets/toast/app_toast.dart';
import '../../../connect_teacher/presentation/views/connect_teacher_page.dart';
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
          }
        },
        child: Scaffold(
          backgroundColor: Colors.white,
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
                  child: AppElevatedButton(
                    text: TextDoc.txtTalk,
                    minimumSize: const Size.fromHeight(48),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConnectTeacherPage(
                          topicId: state.topicDetail.topicId ?? '',
                        ),
                      ),
                    ),
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
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColor.defaultFont,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 128.0 + MediaQuery.of(context).padding.top,
                      ),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
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
                                          const Text(
                                            TextDoc.txtTopicCategory,
                                            style: TextStyle(
                                              fontSize: labelMediumSize,
                                              fontWeight: labelMediumWeight,
                                              color: AppColor.shadow,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              state.topicDetail.topicCategory ??
                                                  'null. This topic is out of this world',
                                              style: const TextStyle(
                                                height: 0.9,
                                                fontSize: bodySmallSize,
                                                fontWeight: bodySmallWeight,
                                                color: AppColor.defaultFont,
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
                                          const Text(
                                            TextDoc.txtTopicLevel,
                                            style: TextStyle(
                                              fontSize: labelMediumSize,
                                              fontWeight: labelMediumWeight,
                                              color: AppColor.shadow,
                                            ),
                                          ),
                                          Expanded(
                                            child: Text(
                                              state.topicDetail.topicLevel ??
                                                  'null. This topic is for Einstein',
                                              style: const TextStyle(
                                                height: 0.9,
                                                fontSize: bodySmallSize,
                                                fontWeight: bodySmallWeight,
                                                color: AppColor.defaultFont,
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
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(height: spacing16),
                              const Text(
                                TextDoc.txtTopicVocab,
                                style: TextStyle(
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
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  height: spacing20,
                                ),
                              ),
                              const SizedBox(height: spacing16),
                              const Text(
                                TextDoc.txtTopicQuestions,
                                style: TextStyle(
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
                                  return QuestionCard(
                                    index: index,
                                    questionContent:
                                        questionContent ?? 'null question',
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
