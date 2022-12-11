import 'package:flutter/material.dart';

class AppColor extends ColorScheme {
  factory AppColor() => colorScheme;

  const AppColor._()
      : super(
          // button
          primary: const Color(0xFF1760A5),
          // text button
          onPrimary: Colors.white,
          // app bar 1
          primaryContainer: const Color(0xFFD3E3FF),
          // text app bar 1
          onPrimaryContainer: const Color(0xFF001C39),
          // unknown
          primaryVariant: const Color(0xFF0D0D0D),
          // unknown
          inversePrimary: const Color(0xFFA3C9FF),
          // divider
          outline: const Color(0xFF73777F),
          // shadow
          shadow: Colors.black12,
          // brightness
          brightness: Brightness.light,
          // background anh
          tertiary: const Color(0xFF6D5677),
          // icon anh
          tertiaryContainer: const Color(0xFFF5D9FF),
          // background icon (loai co background)
          onTertiary: Colors.white,
          onTertiaryContainer: const Color(0xFF261430),
          // app bar 2
          secondary: const Color(0xFF835400),
          // text app bar 2
          onSecondary: Colors.white,
          secondaryContainer: const Color(0xFFFFDDB5),
          onSecondaryContainer: const Color(0xFF2A1800),
          // unknown
          secondaryVariant: const Color(0xFFF2F2F2),
          // error
          error: const Color(0xFFBA1A1A),
          // text error
          onError: Colors.white,
          // error tag
          errorContainer: const Color(0xFFFFDAF6),
          // text on error tag
          onErrorContainer: const Color(0xFF410002),
          // background
          background: const Color(0xFFFDFCFF),
          // use text color
          onBackground: const Color(0xFF1A1C1E),
          // surface
          surface: const Color(0xFFFDFCFF),
          // use text color
          onSurface: const Color(0xFF1A1C1E),
          // tag
          surfaceVariant: const Color(0xFFDFE2EB),
          // text tag
          onSurfaceVariant: const Color(0xFF43474E),
          //  tag 2
          inverseSurface: const Color(0xFF2F3033),
          // text tag 2
          onInverseSurface: const Color(0xFFF1F0F4),
        );

  static const Color bgBottomNav = Color(0xFFEBF0F8);
}

const colorScheme = AppColor._();
