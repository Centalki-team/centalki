import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';
import '../../../../../base/define/theme.dart';

class SettingTile extends StatelessWidget {
  const SettingTile({
    super.key,
    required this.icon,
    required this.title,
    this.foregroundColor,
    required this.onClick,
  });

  final IconData icon;
  final String title;
  final Color? foregroundColor;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            color: colorsByTheme(context).backgroundTheme,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadow.shade300,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: const Offset(0, 1),
              )
            ],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Row(
            children: [
              Icon(
                icon,
                color: foregroundColor ?? colorsByTheme(context).defaultFont,
              ),
              const SizedBox(width: spacing16),
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: bodyLargeSize,
                    fontWeight: bodyLargeWeight,
                    color:
                        foregroundColor ?? colorsByTheme(context).defaultFont,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
