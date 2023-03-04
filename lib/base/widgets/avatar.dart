import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../define/colors.dart';
import '../define/size.dart';

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

  String _getUserDefaultAvatar(String fullName) {
    if (fullName.isEmpty) return '';
    final words = fullName.split(' ');
    var result = '';
    for (var word in words) {
      if (word.isNotEmpty) {
        result += word[0];
      }
    }
    if (result.length > 4) {
      return result.substring(0, 4).toUpperCase();
    }
    return result.toUpperCase();
  }

  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(maxRadius),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(maxRadius),
          child: CircleAvatar(
            backgroundColor: AppColor.secondary,
            maxRadius: maxRadius,
            child: CachedNetworkImage(
              fit: BoxFit.fill,
              imageUrl: avatarUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(
                value: downloadProgress.progress,
              ),
              errorWidget: (context, url, error) => Text(
                _getUserDefaultAvatar(fullName),
                style: const TextStyle(
                  letterSpacing: 1,
                  fontSize: headlineLargeSize,
                  fontWeight: FontWeight.w500,
                  color: AppColor.white,
                ),
              ),
            ),
          ),
        ),
      );
}
