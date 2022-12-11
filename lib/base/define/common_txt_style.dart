import 'package:flutter/cupertino.dart';

// regular:w400, medium:w500, bold:w700
class CommonTxtStyle {
  static TextStyle get t12Medium => const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get t16Medium => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get t36XMedium => const TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
      );
}
