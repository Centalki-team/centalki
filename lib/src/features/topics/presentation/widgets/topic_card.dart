import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../base/widgets/buttons/text_button.dart';
import '../../../topic_detail/presentation/views/topic_detail_page.dart';
import '../../domain/entities/topic_item_entity.dart';
import '../blocs/pre_intermediate_topic_bloc/pre_intermediate_topics_bloc.dart';

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
              Image.network(
                widget.item.image ?? '',
                width: 150,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 150,
                  height: 120,
                  child: Icon(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.item.topicCategory ?? '',
                        style: const TextStyle(
                          fontSize: bodySmallSize,
                          fontWeight: bodySmallWeight,
                          color: AppColor.defaultFont,
                        ),
                      ),
                      Text(
                        widget.item.topicName ?? '',
                        style: const TextStyle(
                          fontSize: titleMediumSize,
                          fontWeight: titleMediumWeight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: spacing12, right: spacing12),
                child: GestureDetector(
                  onTap: () async {
                    widget.onTap.call();
                  },
                  child: widget.item.topicBookmark == null
                      ? SvgPicture.asset(
                          "assets/icon/ic_heart.svg",
                          width: 30,
                          height: 30,
                          color: const Color(0xFF9D9DAD),
                        )
                      : SvgPicture.asset(
                          "assets/icon/ic_heart_fill.svg",
                          width: 30,
                          height: 30,
                          color: const Color(0xFFFF6363),
                        ),
                ),
              ),
            ],
          ),
        ),
      );
}
