import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../define/colors.dart';

class Avatar extends StatelessWidget {
  const Avatar(
      {Key? key,
      required this.avatarUrl,
      required this.maxRadius,
      required this.fullName})
      : super(key: key);

  final String avatarUrl;
  final String fullName;
  final double maxRadius;

  String getUserDefaultAvatar(String fullName) {
    if (fullName.isEmpty) return '';
    final splitName = fullName.split(' ');
    var result = '';
    for (var part in splitName) {
      if (part.isNotEmpty) {
        result += part[0];
      }
    }
    return result;
  }

  @override
  Widget build(BuildContext context) => CircleAvatar(
        backgroundColor: secondary,
        maxRadius: maxRadius,
        child: CachedNetworkImage(
          fit: BoxFit.fill,
          imageUrl: avatarUrl,
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              CircularProgressIndicator(
            value: downloadProgress.progress,
          ),
          errorWidget: (context, url, error) => Text(
            getUserDefaultAvatar(fullName),
          ),
        ),
      );
}
