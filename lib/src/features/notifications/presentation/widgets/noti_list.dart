import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../domain/entities/noti_list_item_entity.dart';
import 'noti_item_card.dart';

class NotiList extends StatelessWidget {
  const NotiList({
    super.key,
    required this.title,
    required this.notiList,
    required this.selectedList,
    this.markAsRead,
    this.needTimeAgoConvert = false,
  });

  final String title;
  final List<NotiListItemEntity> notiList;
  final List<NotiListItemEntity> selectedList;
  final Function(NotiListItemEntity)? markAsRead;
  final bool needTimeAgoConvert;

  @override
  Widget build(BuildContext context) => notiList.isEmpty
      ? const SizedBox.shrink()
      : Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(
                spacing16,
                spacing24,
                spacing16,
                spacing8,
              ),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: titleLargeSize,
                  fontWeight: titleLargeWeight,
                  color: AppColor.defaultFont,
                  height: 28 / 30,
                ),
              ),
            ),
            ListView.separated(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(
                horizontal: spacing16,
              ),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (ctx, index) => NotiItemCard(
                notiListItemEntity: notiList[index],
                isSelected:
                    selectedList.map((e) => e.id).contains(notiList[index].id),
                needConvertTimeAgo: needTimeAgoConvert,
                markAsRead: markAsRead,
              ),
              itemCount: notiList.length,
              separatorBuilder: (ctx, index) => const SizedBox(
                height: spacing8,
              ),
            ),
          ],
        );
}
