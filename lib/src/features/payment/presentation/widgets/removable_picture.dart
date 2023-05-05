import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../base/define/colors.dart';
import '../../../../../gen/assets.gen.dart';

class RemovablePicture extends StatelessWidget {
  const RemovablePicture({
    super.key,
    required this.imagePath,
    this.onRemove,
  });

  final String imagePath;
  final Function()? onRemove;

  @override
  Widget build(BuildContext context) => Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            width: 88.0,
            height: 88.0,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4.0,
                  spreadRadius: 0.0,
                  color: AppColor.shadow,
                ),
              ],
            ),
            child: Image.file(
              File(imagePath),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 8.0,
              right: 8.0,
            ),
            child: GestureDetector(
              onTap: () async {
                onRemove?.call();
              },
              child: Assets.icon.icClearCircle.svg(
                width: 24.0,
                height: 24.0,
              ),
            ),
          ),
        ],
      );
}
