import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../../shared/utilities/datetime_helper.dart';
import '../../domain/entities/noti_list_item_entity.dart';

class NotiItemCard extends StatelessWidget {
  const NotiItemCard({
    super.key,
    required this.notiListItemEntity,
    this.isSelected = false,
    this.needConvertTimeAgo = false,
    this.markAsRead,
  });

  final NotiListItemEntity notiListItemEntity;
  final bool isSelected;
  final bool needConvertTimeAgo;
  final Function(NotiListItemEntity)? markAsRead;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          markAsRead?.call(notiListItemEntity);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: spacing16,
            vertical: spacing8,
          ),
          decoration: BoxDecoration(
            color: notiListItemEntity.seenAtTime != null
                ? colorsByTheme(context).backgroundCardsChip
                : AppColor.mainColor2Surface.shade500,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (notiListItemEntity.seenAtTime != null
                      ? Assets.icon.icNotiRead
                      : Assets.icon.icNotiUnread)
                  .image(
                width: 48,
                height: 48,
              ),
              const SizedBox(
                width: spacing16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      notiListItemEntity.title?.en ?? '',
                      style: TextStyle(
                        fontSize: titleMediumSize,
                        fontWeight: titleMediumWeight,
                        color: notiListItemEntity.seenAtTime != null
                            ? colorsByTheme(context).defaultFont
                            : AppColor.defaultFontLight,
                        height: 1.0,
                      ),
                    ),
                    Text(
                      notiListItemEntity.body?.en ?? '',
                      style: TextStyle(
                        fontSize: bodySmallSize,
                        fontWeight: bodySmallWeight,
                        color: notiListItemEntity.seenAtTime != null
                            ? colorsByTheme(context).defaultFont
                            : AppColor.defaultFontLight,
                        height: 16 / 20,
                      ),
                      maxLines: isSelected ? 1000 : 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (notiListItemEntity.createdAtTime != null) ...[
                      const SizedBox(
                        height: spacing8,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          needConvertTimeAgo
                              ? timeago
                                  .format(notiListItemEntity.createdAtTime!)
                              : AppDateTimeHelper.timeToStringHHmmDDmmYYYY(
                                  notiListItemEntity.createdAtTime,
                                ),
                          style: const TextStyle(
                            fontSize: bodySmallSize,
                            fontWeight: bodySmallWeight,
                            color: AppColor.shadow,
                            height: 16 / 20,
                          ),
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
