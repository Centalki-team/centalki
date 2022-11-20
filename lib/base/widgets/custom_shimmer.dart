import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MyShimmer {
  static Shimmer shimmerBuilder({required Widget child}) => Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade50,
        child: child,
      );
}
