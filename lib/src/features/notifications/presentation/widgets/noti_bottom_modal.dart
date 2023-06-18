import 'package:flutter/material.dart';

import '../../../../../base/define/dimensions.dart';
import '../../../../../base/define/size.dart';
import '../../../../../base/define/theme.dart';
import '../../../../../generated/l10n.dart';

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
          decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundCardsChip,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              NotiModalOption(
                iconData: Icons.notifications_none_rounded,
                title: S.current.txtMarkAllNotiAsRead,
                onTap: () => Navigator.pop(context, 0),
              ),
              const SizedBox(
                height: spacing24,
              ),
              NotiModalOption(
                iconData: Icons.notifications_active_outlined,
                title: S.current.txtMarkAllNotiAsUnread,
                onTap: () => Navigator.pop(context, 1),
              ),
            ],
          ),
        ),
      );
}

class NotiModalOption extends StatelessWidget {
  const NotiModalOption({
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
              color: colorsByTheme(context).defaultFont,
            ),
            const SizedBox(
              width: spacing16,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: bodySmallSize,
                fontWeight: bodySmallWeight,
                color: colorsByTheme(context).defaultFont,
                height: 16 / 20,
              ),
            ),
          ],
        ),
      );
}
