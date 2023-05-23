import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../base/define/styles.dart';
import '../../../../../../base/define/theme.dart';
import '../../../../../../base/widgets/buttons/text_button.dart';
import '../../../../../../gen/assets.gen.dart';
import '../../../../../../generated/l10n.dart';
import '../../../bookmark/topic/domain/entities/bookmark_topic_entity.dart';
import '../../../topic_detail/presentation/views/topic_detail_page.dart';
import '../blocs/favorite_topics_bloc.dart';

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
          height: 128,
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
                width: 128,
                height: 128,
                child: CachedNetworkImage(
                  imageUrl: widget.bookmark.bookmarkTopic?.topicImage ?? '',
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
                  padding: const EdgeInsets.all(padding12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              widget.bookmark.bookmarkTopic?.topicName ?? '',
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
                          BlocBuilder<FavoriteTopicsBloc, FavoriteTopicsState>(
                            builder: (context, state) => GestureDetector(
                              onTap: () async {
                                await showDialog(
                                  barrierDismissible: false,
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    backgroundColor: colorsByTheme(context)
                                        .backgroundCardsChip,
                                    title: Text(
                                      S.current.txtConfirmRemoveFavoriteTitle,
                                      style: TextStyle(
                                        fontSize: titleMediumSize,
                                        fontWeight: titleMediumWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                    ),
                                    content: Text(
                                      S.current.txtConfirmRemoveFavoriteContent,
                                      style: TextStyle(
                                        fontSize: bodySmallSize,
                                        fontWeight: bodySmallWeight,
                                        color:
                                            colorsByTheme(context).defaultFont,
                                      ),
                                    ),
                                    actions: [
                                      AppTextButton(
                                        text: S.current.txtCancel,
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
                                        child: Text(
                                          S.current.txtRemove,
                                          style: const TextStyle(
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
                              child: Assets.icon.icHeartFill.svg(
                                width: 24,
                                height: 24,
                                color: AppColor.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: spacing8,
                      ),
                      Text(
                        widget.bookmark.bookmarkTopic?.topicCategory ?? '',
                        style: TextStyle(
                          fontSize: bodySmallSize,
                          fontWeight: bodySmallWeight,
                          color: colorsByTheme(context).defaultFont,
                          height: 16 / 20,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Spacer(),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          widget.bookmark.bookmarkTopic?.topicLevel ?? '',
                          style: const TextStyle(
                            color: AppColor.shadow,
                            fontSize: bodySmallSize,
                            fontWeight: bodySmallWeight,
                            height: 16 / 20,
                          ),
                        ),
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
