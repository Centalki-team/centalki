import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/button.dart';
import '../../../connect_teacher/presentation/views/connect_teacher_page.dart';
import '../blocs/topic_detail_bloc/topic_detail_bloc.dart';
import '../widgets/phrase_card.dart';
import '../widgets/question_card.dart';

class TopicDetailView extends StatefulWidget {
  const TopicDetailView({Key? key}) : super(key: key);

  @override
  State<TopicDetailView> createState() => _TopicDetailViewState();
}

class _TopicDetailViewState extends State<TopicDetailView> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: BlocBuilder<TopicDetailBloc, TopicDetailState>(
          buildWhen: (previous, current) => current is TopicDetailLoadDoneState,
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
                        text: TextDoc.txtTalk,
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
                            width: isFavorite ? 2.0 : 1.0,
                            color: isFavorite
                                ? const Color(0xFFFF6363)
                                : const Color(0xFF9D9DAD)),
                      ),
                      child: GestureDetector(
                        onTap: () async {
                          if (isFavorite) {
                            await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => AlertDialog(
                                backgroundColor: AppColor.white,
                                title: const Text(
                                  TextDoc.txtConfirmRemoveFavoriteTitle,
                                  style: TextStyle(
                                    fontSize: titleLargeSize,
                                    fontWeight: titleLargeWeight,
                                    color: AppColor.defaultFont,
                                  ),
                                ),
                                content: const Text(
                                  TextDoc.txtConfirmRemoveFavoriteContent,
                                  style: TextStyle(
                                    fontSize: bodySmallSize,
                                    fontWeight: bodySmallWeight,
                                    color: AppColor.defaultFont,
                                  ),
                                ),
                                actions: [
                                  AppTextButton(
                                    text: TextDoc.txtCancel,
                                    onPressed: () =>
                                        Navigator.pop(context, false),
                                  ),
                                  ElevatedButton(
                                    onPressed: () => {
                                      context
                                          .read<TopicDetailBloc>()
                                          .add(TopicDetailRemoveFavoriteEvent(
                                            topicId:
                                                state.topicDetail.topicId ?? '',
                                          )),
                                      setState(() {
                                        isFavorite = false;
                                      }),
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.error,
                                      foregroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      TextDoc.txtRemove,
                                      style: TextStyle(
                                        fontSize: labelLargeSize,
                                        fontWeight: labelLargeWeight,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ).then((value) => value ?? false);
                          } else {
                            context
                                .read<TopicDetailBloc>()
                                .add(TopicDetailAddFavoriteEvent(
                                  topicId: state.topicDetail.topicId ?? '',
                                ));
                            setState(() {
                              isFavorite = true;
                            });
                          }
                        },
                        child: !isFavorite
                            ? SvgPicture.asset(
                                "assets/icon/ic_heart.svg",
                                color: const Color(0xFF9D9DAD),
                              )
                            : SvgPicture.asset(
                                "assets/icon/ic_heart_fill.svg",
                                color: const Color(0xFFFF6363),
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
                                crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                return PhraseCard(phraseEntity: phrase);
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
                                  state.topicDetail.topicQuestions?.length ?? 0,
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
            if (state is TopicDetailLoadFailedState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    state.errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: AppColor.error),
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      );
}
