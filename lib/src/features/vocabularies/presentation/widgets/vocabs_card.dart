import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';
import '../blocs/vocabs_bloc/vocabs_bloc.dart';

class VocabCard extends StatelessWidget {
  const VocabCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final BookmarkVocabsItemEntity item;

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
                          item.phrase?.phrase ?? 'null phrase',
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
                          if (item.id != null && item.id!.isNotEmpty) {
                            context.read<VocabsBloc>().add(
                                VocabsRemoveBookmarkEvent(
                                    bookmarkId: item.id!));
                          }
                        },
                        child: const Icon(
                          Icons.bookmark,
                          color: AppColor.mainColor1,
                          size: 24.0,
                        ),
                      )
                    ],
                  ),
                  Text(
                    item.phrase?.phonetic ?? 'no phonetic',
                    style: const TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: bodySmallSize * 0.6,
                      fontWeight: bodySmallWeight,
                      color: AppColor.defaultFont,
                    ),
                  ),
                  const SizedBox(height: spacing4),
                  ...(item.phrase?.translations ?? []).map(
                    (e) => Text(
                      e.meaning ?? 'null meaning',
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
              ...(item.phrase?.examples ?? []).map(
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
                        e.sentence ?? 'null example',
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
