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
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.all(Radius.circular(12.0)),
          // boxShadow: [
          //   BoxShadow(
          //     color: AppColor.shadow.shade200,
          //     blurRadius: 4.0,
          //     spreadRadius: 0.0,
          //     offset: const Offset(0, 2),
          //   )
          // ],
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
                      context
                          .read<VocabsBloc>()
                          .add(VocabsRemoveBookmarkEvent(bookmarkId: item.id!));
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
                ),
              ),
            ),
            const SizedBox(height: spacing2),
            ...(item.phrase?.examples ?? []).map(
              (e) => Text(
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
      );
}