import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/widgets/buttons/text_button.dart';
import '../../../../bookmark/topic/domain/entities/bookmark_topic_entity.dart';
import '../../../../topic_detail/presentation/views/topic_detail_page.dart';
import '../../blocs/favorite_topics_bloc.dart';

class FavoriteTopicCard extends StatefulWidget {
  const FavoriteTopicCard({
    Key? key,
    required this.bookmark,
  }) : super(key: key);

  final BookmarkTopicEntity bookmark;

  @override
  State<FavoriteTopicCard> createState() => _FavoriteTopicCardState();
}

class _FavoriteTopicCardState extends State<FavoriteTopicCard> {
  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => TopicDetailPage(
              topicId: widget.bookmark.bookmarkTopic?.topicId ?? '',
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
                widget.bookmark.bookmarkTopic?.topicImage ?? '',
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
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.bookmark.bookmarkTopic
                                          ?.topicCategory ??
                                      '',
                                  style: const TextStyle(
                                    fontSize: bodySmallSize,
                                    fontWeight: bodySmallWeight,
                                    color: AppColor.defaultFont,
                                  ),
                                ),
                                Text(
                                  widget.bookmark.bookmarkTopic?.topicName ??
                                      '',
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
                          margin: const EdgeInsets.only(
                              top: spacing12, right: spacing12),
                          child: BlocBuilder<FavoriteTopicsBloc,
                              FavoriteTopicsState>(
                            builder: (context, state) => GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: AppColor.white,
                                    title: const Text(
                                      TextDoc.txtConfirmRemoveFavoriteTitle,
                                      style: TextStyle(
                                        fontSize: titleMediumSize,
                                        fontWeight: titleMediumWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                    content: const Text(
                                      TextDoc.txtConfirmRemoveFavoriteContent,
                                      style: TextStyle(
                                        fontSize: bodySmallSize,
                                        fontWeight: bodySmallWeight,
                                        color: AppColor.defaultFont,
                                      ),
                                    ),
                                    actions: [
                                      AppTextButton(
                                        text: TextDoc.txtCancel,
                                        onPressed: () =>
                                            Navigator.pop(context, false),
                                      ),
                                      ElevatedButton(
                                        onPressed: () =>
                                            Navigator.pop(context, true),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: AppColor.error,
                                          foregroundColor: Colors.white,
                                        ),
                                        child: const Text(
                                          TextDoc.txtRemove,
                                          style: TextStyle(
                                            fontSize: labelLargeSize,
                                            fontWeight: labelLargeWeight,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ).then((confirmRemoved) => {
                                      if (confirmRemoved)
                                        {
                                          context
                                              .read<FavoriteTopicsBloc>()
                                              .add(RemoveFavoriteTopicEvent(
                                                id: widget
                                                        .bookmark.bookmarkId ??
                                                    '',
                                              )),
                                        }
                                    });
                              },
                              child: SvgPicture.asset(
                                "assets/icon/ic_heart_fill.svg",
                                width: 30,
                                height: 30,
                                color: const Color(0xFFFF6363),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: padding12),
                      alignment: Alignment.centerRight,
                      child: Text(
                        widget.bookmark.bookmarkTopic?.topicLevel ?? '',
                        style: const TextStyle(
                            color: AppColor.shadow,
                            fontSize: bodySmallSize,
                            fontWeight: bodySmallWeight),
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
