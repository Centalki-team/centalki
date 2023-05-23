import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';

class VocabCard extends StatelessWidget {
  const VocabCard({
    Key? key,
    required this.item,
    this.onRemoveSaved,
  }) : super(key: key);

  final BookmarkVocabsItemEntity item;
  final Function(BookmarkVocabsItemEntity)? onRemoveSaved;

  @override
  Widget build(BuildContext context) => Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: Container(
          decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundCardsChip,
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
            collapsedBackgroundColor:
                colorsByTheme(context).backgroundCardsChip,
            backgroundColor: colorsByTheme(context).backgroundCardsChip,
            iconColor: colorsByTheme(context).expansionIcon,
            collapsedIconColor: colorsByTheme(context).expansionIcon,
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
                            onRemoveSaved?.call(item);
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
                    style: TextStyle(
                      fontFamily: 'NotoSans',
                      fontSize: bodySmallSize * 0.6,
                      fontWeight: bodySmallWeight,
                      color: colorsByTheme(context).defaultFont,
                    ),
                  ),
                  const SizedBox(height: spacing4),
                  ...(item.phrase?.translations ?? []).map(
                    (e) => Text(
                      e.meaning ?? 'null meaning',
                      style: TextStyle(
                        height: 0.9,
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: colorsByTheme(context).defaultFont,
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
