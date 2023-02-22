import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../topic_detail/presentation/views/topic_detail_page.dart';
import '../../domain/entities/topic_item_entity.dart';

class TopicCard extends StatelessWidget {
  const TopicCard({
    Key? key,
    required this.item,
  }) : super(key: key);

  final TopicItemEntity item;

  @override
  Widget build(BuildContext context) => Card(
      elevation: 1,
      clipBehavior: Clip.hardEdge,
      surfaceTintColor: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Image.network(
            item.image ?? '',
            width: 128,
            height: 128,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox(
              width: 128,
              height: 128,
              child: Icon(
                Icons.error_outline_rounded,
                size: 32,
                color: Colors.red,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.topicName ?? '',
                    style: const TextStyle(
                      fontSize: titleMediumSize,
                      fontWeight: titleMediumWeight,
                    ),
                  ),
                  const SizedBox(height: smallSpacing6),
                  Text(
                    item.topicCategory ?? '',
                    style: const TextStyle(
                      fontSize: bodySmallSize,
                      fontWeight: bodySmallWeight,
                    ),
                  ),
                  const SizedBox(height: spaceBetweenLine12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => TopicDetailPage(topicId: item.topicId ?? ''),
                          ),
                        ),
                        child: Row(
                          children: const [
                            Icon(
                              Icons.featured_play_list_rounded,
                              color: AppColor.mainColor1,
                              size: 20,
                            ),
                            SizedBox(width: smallSpacing6),
                            Text(
                              'Detail',
                              style: TextStyle(color: AppColor.mainColor1),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: spaceBetweenLine12),
                      TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: AppColor.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32),
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Talk',
                          style: TextStyle(color: AppColor.defaultFont),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
}
