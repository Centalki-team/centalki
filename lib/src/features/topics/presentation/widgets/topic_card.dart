import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../gen/assets.gen.dart';
import '../../../topic_detail/presentation/views/topic_detail_page.dart';
import '../../domain/entities/topic_item_entity.dart';

class TopicCard extends StatefulWidget {
  const TopicCard({
    Key? key,
    required this.item,
    required this.onTap,
  }) : super(key: key);

  final TopicItemEntity item;
  final Function() onTap;

  @override
  State<TopicCard> createState() => _TopicCardState();
}

class _TopicCardState extends State<TopicCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TopicDetailPage(
              topicId: widget.item.topicId ?? '',
            ),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.all(spacing8),
          height: 150,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
              color: AppColor.white,
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: [
                BoxShadow(
                  color: AppColor.shadow.shade300,
                  spreadRadius: 0,
                  blurRadius: 4.0,
                  offset: const Offset(0, 2),
                )
              ]),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 150,
                width: 150,
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
                              style: const TextStyle(
                                fontSize: titleMediumSize,
                                fontWeight: titleMediumWeight,
                                color: AppColor.defaultFont,
                                height: 1.0,
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
                      Text(
                        widget.item.topicCategory ?? '',
                        style: const TextStyle(
                          fontSize: bodySmallSize,
                          fontWeight: bodySmallWeight,
                          color: AppColor.defaultFont,
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
}
