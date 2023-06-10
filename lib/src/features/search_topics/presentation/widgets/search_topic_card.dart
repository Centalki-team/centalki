import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../topic_detail/presentation/views/topic_detail_page.dart';
import '../../../topics/domain/entities/topic_item_entity.dart';

class SearchTopicCard extends StatelessWidget {
  const SearchTopicCard({
    super.key,
    required this.item,
    this.onFavTap,
    this.onTopicsRefresh,
  });

  final TopicItemEntity item;
  final Function()? onFavTap;
  final Function()? onTopicsRefresh;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TopicDetailPage(
                topicId: item.topicId ?? '',
              ),
            ),
          );
          onTopicsRefresh?.call();
        },
        child: Container(
          margin: const EdgeInsets.all(spacing8),
          height: 120,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: colorsByTheme(context).backgroundCardsChip,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadow.shade300,
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  offset: const Offset(1, 2),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: CachedNetworkImage(
                  imageUrl: item.image ?? '',
                  fit: BoxFit.cover,
                  errorWidget: (context, error, stackTrace) => const Icon(
                    Icons.error_outline_rounded,
                    size: 32,
                    color: Colors.red,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              item.topicName ?? '',
                              style: TextStyle(
                                fontSize: titleMediumSize,
                                fontWeight: titleMediumWeight,
                                color: colorsByTheme(context).defaultFont,
                                height: 0.9,
                              ),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            width: spacing8,
                          ),
                          GestureDetector(
                            onTap: () async {
                              onFavTap?.call();
                            },
                            child: item.topicBookmark == null
                                ? Assets.icon.icHeart.svg(
                                    width: 24,
                                    height: 24,
                                    color: AppColor.shadow,
                                  )
                                : Assets.icon.icHeartFill.svg(
                                    width: 24,
                                    height: 24,
                                    color: AppColor.error,
                                  ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      Text(
                        item.topicCategory ?? '',
                        style: TextStyle(
                          fontSize: bodySmallSize,
                          fontWeight: bodySmallWeight,
                          color: colorsByTheme(context).defaultFont,
                          height: 16 / 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      // const Spacer(),
                      // Align(
                      //   alignment: Alignment.bottomRight,
                      //   child: Text(
                      //     item. ?? '',
                      //     style: const TextStyle(
                      //       color: AppColor.shadow,
                      //       fontSize: bodySmallSize,
                      //       fontWeight: bodySmallWeight,
                      //       height: 16 / 20,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
