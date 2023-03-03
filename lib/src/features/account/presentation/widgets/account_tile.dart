import 'package:flutter/material.dart';

import '../../../../../base/define/styles.dart';

class AccountTile extends StatelessWidget {
  const AccountTile({
    Key? key,
    required this.icon,
    required this.title,
    this.foregroundColor,
    required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color? foregroundColor;
  final Function() onTap;

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColor.white,
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
          child: Row(
            children: [
              Icon(
                icon,
                color: foregroundColor ?? AppColor.defaultFont,
              ),
              const SizedBox(width: spacing16),
              Text(
                title,
                style: TextStyle(
                  fontSize: bodyLargeSize,
                  fontWeight: bodyLargeWeight,
                  color: foregroundColor ?? AppColor.defaultFont,
                ),
              )
            ],
          ),
        ),
      );
}
