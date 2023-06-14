import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../bookmark/domain/entities/bookmark_phrase_item_entity.dart';

class VocabFlashCard extends StatefulWidget {
  const VocabFlashCard({
    super.key,
    required this.bookmarkVocabsItemEntity,
    //required this.currentTabIndex,
  });

  final BookmarkVocabsItemEntity bookmarkVocabsItemEntity;

  //final ValueNotifier<int> currentTabIndex;

  @override
  State<VocabFlashCard> createState() => _VocabFlashCardState();
}

class _VocabFlashCardState extends State<VocabFlashCard> {
  int valueDisplay = 0; //0: title, 1:meaning,example

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          setState(() {
            valueDisplay = valueDisplay == 0 ? 1 : 0;
          });
        },
        child: Container(
          height: 300,
          width: 250,
          margin: const EdgeInsets.symmetric(
            horizontal: spacing32,
            vertical: spacing16,
          ),
          padding: const EdgeInsets.all(spacing16),
          decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundCardsChip,
            borderRadius: BorderRadius.circular(24.0),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 2),
                blurRadius: 10,
                spreadRadius: 4,
                color: colorsByTheme(context).expansionIcon!.withOpacity(0.25),
              ),
            ],
          ),
          child: valueDisplay == 0
              ? Center(
                  child: Text(
                    widget.bookmarkVocabsItemEntity.phrase?.phrase ?? '',
                    style: const TextStyle(
                      fontSize: titleMediumSize,
                      fontWeight: titleMediumWeight,
                      color: AppColor.mainColor1,
                      height: 1,
                    ),
                  ),
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (widget.bookmarkVocabsItemEntity.phrase?.translations ?? []).sample(1).single.meaning ?? '',
                        style: TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                          color: colorsByTheme(context).defaultFont,
                          height: 1,
                        ),
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      Text(
                        (widget.bookmarkVocabsItemEntity.phrase?.examples ?? []).sample(1).single.sentence ?? '',
                        style: TextStyle(
                          fontSize: bodyLargeSize,
                          fontWeight: bodyLargeWeight,
                          color: colorsByTheme(context).defaultFont,
                          height: 1,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
        ),
      );
}
