import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';

class NotiModalBottomSheet extends StatelessWidget {
  const NotiModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        top: false,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: spacing16,
            vertical: spacing18,
          ),
          decoration: const BoxDecoration(
            color: AppColor.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NotiModalOtion(
                iconData: Icons.notifications_none_rounded,
                title: 'Mark all notifications as read',
                onTap: () => Navigator.pop(context, 0),
              ),
              const SizedBox(
                height: spacing24,
              ),
              NotiModalOtion(
                iconData: Icons.notifications_active_outlined,
                title: 'Mark all notifications as unread',
                onTap: () => Navigator.pop(context, 1),
              ),
              const SizedBox(
                height: spacing24,
              ),
              NotiModalOtion(
                iconData: Icons.edit_notifications_outlined,
                title: 'Edit notifications settings',
                onTap: () => Navigator.pop(context, 2),
              ),
            ],
          ),
        ),
      );
}

class NotiModalOtion extends StatelessWidget {
  const NotiModalOtion({
    super.key,
    required this.iconData,
    required this.title,
    this.onTap,
  });

  final IconData iconData;
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              iconData,
              size: 24.0,
            ),
            const SizedBox(
              width: spacing16,
            ),
            Text(
              title,
              style: const TextStyle(
                fontSize: bodySmallSize,
                fontWeight: bodySmallWeight,
                color: AppColor.defaultFont,
                height: 16 / 20,
              ),
            ),
          ],
        ),
      );
}
