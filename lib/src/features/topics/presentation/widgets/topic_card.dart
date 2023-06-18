import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../topic_detail/presentation/views/topic_detail_page.dart';
import '../../../tracking/tracking.dart';
import '../../domain/entities/topic_item_entity.dart';

class TopicCard extends StatefulWidget {
  const TopicCard({
    Key? key,
    required this.item,
    required this.onTap,
    this.onTopicsRefresh,
    required this.logKey,
    required this.logName,
  }) : super(key: key);

  final TopicItemEntity item;
  final Function() onTap;
  final Function()? onTopicsRefresh;
  final String logKey;
  final String logName;

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () async {
          logSelectItem(entity: widget.item);
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TopicDetailPage(
                topicId: widget.item.topicId ?? '',
              ),
            ),
          );
          widget.onTopicsRefresh?.call();
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
                  imageUrl: widget.item.image ?? '',
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
                              widget.item.topicName ?? '',
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
                              widget.onTap.call();
                            },
                            child: widget.item.topicBookmark == null
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
                        widget.item.topicCategory ?? '',
                        style: TextStyle(
                          fontSize: bodySmallSize,
                          fontWeight: bodySmallWeight,
                          color: colorsByTheme(context).defaultFont,
                          height: 16 / 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );

  void logSelectItem({
    TopicItemEntity? entity,
  }) {
    Analytics.inst?.ecommerce(
      (logger) => logger?.logSelectItem(
        itemListId: widget.logKey,
        itemListName: widget.logName,
        items: [
          EcommerceItem(
            itemId: entity?.topicId,
            itemName: entity?.topicName,
            itemCategory: entity?.topicCategory,
          )
        ],
      ),
    );
  }
}
