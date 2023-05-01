import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/styles.dart';
import '../../domain/entities/topic_detail_entity.dart';
import '../blocs/topic_detail_bloc/topic_detail_bloc.dart';

class PhraseCard extends StatelessWidget {
  const PhraseCard({
    Key? key,
    required this.phraseEntity,
  }) : super(key: key);

  final TopicPhraseEntity phraseEntity;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.circular(12.0),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.shade200,
                blurRadius: 4.0,
                spreadRadius: 0.0,
                offset: const Offset(1, 2),
              )
            ],
          ),
          clipBehavior: Clip.hardEdge,
          child: ExpansionTile(
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            expandedCrossAxisAlignment: CrossAxisAlignment.start,
            childrenPadding: const EdgeInsets.only(
              left: padding32,
              bottom: padding12,
            ),
            title: Padding(
              padding: const EdgeInsets.only(
                top: padding4,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          phraseEntity.topicPhrase ?? 'null phrase',
                          style: const TextStyle(
                            height: 0.9,
                            fontSize: titleMediumSize,
                            fontWeight: titleMediumWeight,
                            color: AppColor.mainColor1,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (phraseEntity.bookmark == null) {
                            if (phraseEntity.topicPhraseId != null &&
                                phraseEntity.topicPhraseId!.isNotEmpty) {
                              context.read<TopicDetailBloc>().add(
                                  TopicDetailPhraseCreateBookmarkEvent(
                                      phraseId: phraseEntity.topicPhraseId!));
                            }
                          } else {
                            if (phraseEntity.bookmark!.id != null &&
                                phraseEntity.bookmark!.id!.isNotEmpty) {
                              context.read<TopicDetailBloc>().add(
                                  TopicDetailPhraseRemoveBookmarkEvent(
                                      bookmarkId: phraseEntity.bookmark!.id!));
                            }
                          }
                        },
                        child: phraseEntity.bookmark != null
                            ? const Icon(
                                Icons.bookmark,
                                color: AppColor.mainColor1,
                                size: 24.0,
                              )
                            : const Icon(
                                Icons.bookmark_border,
                                color: AppColor.shadow,
                                size: 24.0,
                              ),
                      )
                    ],
                  ),
                  Text(
                    phraseEntity.phrasePhonetic ?? 'no phonetic',
                    style: const TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: bodySmallSize * 0.6,
                      fontWeight: bodySmallWeight,
                      color: AppColor.defaultFont,
                    ),
                  ),
                  const SizedBox(height: spacing4),
                  ...phraseEntity.phraseTranslations!.map(
                    (e) => Text(
                      e.phraseMeaning ?? 'null meaning',
                      style: const TextStyle(
                        height: 0.9,
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: AppColor.defaultFont,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            children: [
              const SizedBox(height: spacing2),
              ...phraseEntity.phraseExamples!.map(
                (e) => Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "• ",
                      style: TextStyle(
                        height: 0.9,
                        fontSize: bodyMediumSize,
                        fontWeight: bodyMediumWeight,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        e.phraseExample ?? 'null example',
                        style: const TextStyle(
                          height: 0.9,
                          fontSize: bodyMediumSize,
                          fontWeight: bodyMediumWeight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
