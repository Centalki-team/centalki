import 'dart:math';

import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  AppColor({
    required this.defaultFont,
    required this.icon,
    required this.iconBackground,
    required this.backgroundTheme,
    required this.backgroundCardHistoryWallet,
    required this.backgroundAvatar,
    required this.hintTextColor,
    required this.tabTitleColor,
    required this.backgroundCardsChip,
    required this.expansionIcon,
    required this.selectableChipBg,
  });

  final Color? defaultFont;

  ///ONLY FOR LEARN VOCABS BUTTON
  final Color? icon;

  ///ONLY FOR LEARN VOCABS BUTTON
  final Color? iconBackground;

  final Color? backgroundTheme;
  final Color? backgroundCardHistoryWallet;
  final Color? backgroundAvatar;
  final Color? hintTextColor;
  final Color? tabTitleColor;
  final Color? backgroundCardsChip;
  final Color? expansionIcon;
  final Color? selectableChipBg;

  // Main Color 1
  static const mainColor1 =
      MaterialColor(0xFF3AAFFF, AppColorSwatch.mainColor1Swatch);
  static const mainColor1Container =
      MaterialColor(0xFF60BCFB, AppColorSwatch.mainColor1ContainerSwatch);
  static const mainColor1Surface =
      MaterialColor(0xFFB0DFFF, AppColorSwatch.mainColor1SurfaceSwatch);
  // Main Color 2
  static const mainColor2 =
      MaterialColor(0xFFFFD033, AppColorSwatch.mainColor2Swatch);
  static const mainColor2Container =
      MaterialColor(0xFFFFD958, AppColorSwatch.mainColor2ContainerSwatch);
  static const mainColor2Surface =
      MaterialColor(0xFFFFE384, AppColorSwatch.mainColor2SurfaceSwatch);
  // Auxiliary Colors
  static const secondary =
      MaterialColor(0xFFFF8811, AppColorSwatch.secondarySwatch);
  static const tertiary =
      MaterialColor(0xFFA55FEF, AppColorSwatch.tertiarySwatch);
  static const support =
      MaterialColor(0xFF55C885, AppColorSwatch.secondarySwatch);
  static const error = MaterialColor(0xFFFF6363, AppColorSwatch.errorSwatch);
  // Font Colors
  static const defaultFontLight =
      MaterialColor(0xFF1B1B2A, AppColorSwatch.defaultFontSwatch);
  static const defaultFontContainer =
      MaterialColor(0xFF3A3A4F, AppColorSwatch.defaultFontColorSwatch);
  // Generic Colors
  static const shadow = MaterialColor(0xFF9D9DAD, AppColorSwatch.shadowSwatch);
  static const container =
      MaterialColor(0xFFCECED6, AppColorSwatch.containerSwatch);
  static const background =
      MaterialColor(0xFFE6E6EA, AppColorSwatch.backgroundSwatch);
  static const white = MaterialColor(0xFFFFFFFF, AppColorSwatch.whiteSwatch);
  static const backgroundLight =
      MaterialColor(0xFFFFFFFF, AppColorSwatch.whiteSwatch);
  //DarkMode
  static const backgroundLogo = MaterialColor(0xFF1c284C, {});
  static const defaultFontDark =
      MaterialColor(0xFFFFFFFF, AppColorSwatch.whiteSwatch);
  static const backgroundDark = MaterialColor(0xFF121212, {});
  static const darkModeContainer = MaterialColor(0xFF2C2C2C, {});

  @override
  ThemeExtension<AppColor> copyWith({
    Color? defaultFont,
    Color? icon,
    Color? iconBackground,
    Color? backgroundTheme,
    Color? backgroundCardHistoryWallet,
    Color? backgroundAvatar,
    Color? hintTextColor,
    Color? tabTitleColor,
    Color? backgroundCardsChip,
    Color? expansionIcon,
    Color? selectableChipBg,
  }) =>
      AppColor(
        defaultFont: defaultFont ?? this.defaultFont,
        icon: icon ?? this.icon,
        iconBackground: iconBackground ?? this.iconBackground,
        backgroundTheme: backgroundTheme ?? this.backgroundTheme,
        backgroundCardHistoryWallet:
            backgroundCardHistoryWallet ?? this.backgroundCardHistoryWallet,
        backgroundAvatar: backgroundAvatar ?? this.backgroundAvatar,
        hintTextColor: hintTextColor ?? this.hintTextColor,
        tabTitleColor: tabTitleColor ?? this.tabTitleColor,
        backgroundCardsChip: backgroundCardsChip ?? this.backgroundCardsChip,
        expansionIcon: expansionIcon ?? this.expansionIcon,
        selectableChipBg: selectableChipBg ?? this.selectableChipBg,
      );

  @override
  ThemeExtension<AppColor> lerp(ThemeExtension<AppColor>? other, double t) {
    if (other is! AppColor) {
      return this;
    }
    return AppColor(
      defaultFont: Color.lerp(defaultFont, other.defaultFont, t),
      icon: Color.lerp(icon, other.icon, t),
      iconBackground: Color.lerp(iconBackground, other.iconBackground, t),
      backgroundTheme: Color.lerp(backgroundTheme, other.backgroundTheme, t),
      backgroundCardHistoryWallet: Color.lerp(
          backgroundCardHistoryWallet, other.backgroundCardHistoryWallet, t),
      backgroundAvatar: Color.lerp(backgroundAvatar, other.backgroundAvatar, t),
      hintTextColor: Color.lerp(hintTextColor, other.hintTextColor, t),
      tabTitleColor: Color.lerp(tabTitleColor, other.tabTitleColor, t),
      backgroundCardsChip:
          Color.lerp(backgroundCardsChip, other.backgroundCardsChip, t),
      expansionIcon: Color.lerp(expansionIcon, other.expansionIcon, t),
      selectableChipBg: Color.lerp(selectableChipBg, other.selectableChipBg, t),
    );
  }
}

class AppColorSwatch {
  static const Map<int, Color> mainColor1Swatch = {
    50: Color.fromRGBO(58, 175, 255, .1),
    100: Color.fromRGBO(58, 175, 255, .2),
    200: Color.fromRGBO(58, 175, 255, .3),
    300: Color.fromRGBO(58, 175, 255, .4),
    400: Color.fromRGBO(58, 175, 255, .5),
    500: Color.fromRGBO(58, 175, 255, .6),
    600: Color.fromRGBO(58, 175, 255, .7),
    700: Color.fromRGBO(58, 175, 255, .8),
    800: Color.fromRGBO(58, 175, 255, .9),
    900: Color.fromRGBO(58, 175, 255, 1),
  };
  static const Map<int, Color> mainColor1ContainerSwatch = {
    50: Color.fromRGBO(96, 188, 251, .1),
    100: Color.fromRGBO(96, 188, 251, .2),
    200: Color.fromRGBO(96, 188, 251, .3),
    300: Color.fromRGBO(96, 188, 251, .4),
    400: Color.fromRGBO(96, 188, 251, .5),
    500: Color.fromRGBO(96, 188, 251, .6),
    600: Color.fromRGBO(96, 188, 251, .7),
    700: Color.fromRGBO(96, 188, 251, .8),
    800: Color.fromRGBO(96, 188, 251, .9),
    900: Color.fromRGBO(96, 188, 251, 1),
  };
  static const Map<int, Color> mainColor1SurfaceSwatch = {
    50: Color.fromRGBO(176, 223, 255, .1),
    100: Color.fromRGBO(176, 223, 255, .2),
    200: Color.fromRGBO(176, 223, 255, .3),
    300: Color.fromRGBO(176, 223, 255, .4),
    400: Color.fromRGBO(176, 223, 255, .5),
    500: Color.fromRGBO(176, 223, 255, .6),
    600: Color.fromRGBO(176, 223, 255, .7),
    700: Color.fromRGBO(176, 223, 255, .8),
    800: Color.fromRGBO(176, 223, 255, .9),
    900: Color.fromRGBO(176, 223, 255, 1),
  };
  static const Map<int, Color> mainColor2Swatch = {
    50: Color.fromRGBO(255, 208, 51, .1),
    100: Color.fromRGBO(255, 208, 51, .2),
    200: Color.fromRGBO(255, 208, 51, .3),
    300: Color.fromRGBO(255, 208, 51, .4),
    400: Color.fromRGBO(255, 208, 51, .5),
    500: Color.fromRGBO(255, 208, 51, .6),
    600: Color.fromRGBO(255, 208, 51, .7),
    700: Color.fromRGBO(255, 208, 51, .8),
    800: Color.fromRGBO(255, 208, 51, .9),
    900: Color.fromRGBO(255, 208, 51, 1),
  };
  static const Map<int, Color> mainColor2ContainerSwatch = {
    50: Color.fromRGBO(255, 217, 88, .1),
    100: Color.fromRGBO(255, 217, 88, .2),
    200: Color.fromRGBO(255, 217, 88, .3),
    300: Color.fromRGBO(255, 217, 88, .4),
    400: Color.fromRGBO(255, 217, 88, .5),
    500: Color.fromRGBO(255, 217, 88, .6),
    600: Color.fromRGBO(255, 217, 88, .7),
    700: Color.fromRGBO(255, 217, 88, .8),
    800: Color.fromRGBO(255, 217, 88, .9),
    900: Color.fromRGBO(255, 217, 88, 1),
  };
  static const Map<int, Color> mainColor2SurfaceSwatch = {
    50: Color.fromRGBO(255, 227, 132, .1),
    100: Color.fromRGBO(255, 227, 132, .2),
    200: Color.fromRGBO(255, 227, 132, .3),
    300: Color.fromRGBO(255, 227, 132, .4),
    400: Color.fromRGBO(255, 227, 132, .5),
    500: Color.fromRGBO(255, 227, 132, .6),
    600: Color.fromRGBO(255, 227, 132, .7),
    700: Color.fromRGBO(255, 227, 132, .8),
    800: Color.fromRGBO(255, 227, 132, .9),
    900: Color.fromRGBO(255, 227, 132, 1),
  };
  static const Map<int, Color> secondarySwatch = {
    50: Color.fromRGBO(255, 136, 17, .1),
    100: Color.fromRGBO(255, 136, 17, .2),
    200: Color.fromRGBO(255, 136, 17, .3),
    300: Color.fromRGBO(255, 136, 17, .4),
    400: Color.fromRGBO(255, 136, 17, .5),
    500: Color.fromRGBO(255, 136, 17, .6),
    600: Color.fromRGBO(255, 136, 17, .7),
    700: Color.fromRGBO(255, 136, 17, .8),
    800: Color.fromRGBO(255, 136, 17, .9),
    900: Color.fromRGBO(255, 136, 17, 1),
  };
  static const Map<int, Color> tertiarySwatch = {
    50: Color.fromRGBO(165, 95, 239, .1),
    100: Color.fromRGBO(165, 95, 239, .2),
    200: Color.fromRGBO(165, 95, 239, .3),
    300: Color.fromRGBO(165, 95, 239, .4),
    400: Color.fromRGBO(165, 95, 239, .5),
    500: Color.fromRGBO(165, 95, 239, .6),
    600: Color.fromRGBO(165, 95, 239, .7),
    700: Color.fromRGBO(165, 95, 239, .8),
    800: Color.fromRGBO(165, 95, 239, .9),
    900: Color.fromRGBO(165, 95, 239, 1),
  };
  static const Map<int, Color> supportSwatch = {
    50: Color.fromRGBO(85, 200, 133, .1),
    100: Color.fromRGBO(85, 200, 133, .2),
    200: Color.fromRGBO(85, 200, 133, .3),
    300: Color.fromRGBO(85, 200, 133, .4),
    400: Color.fromRGBO(85, 200, 133, .5),
    500: Color.fromRGBO(85, 200, 133, .6),
    600: Color.fromRGBO(85, 200, 133, .7),
    700: Color.fromRGBO(85, 200, 133, .8),
    800: Color.fromRGBO(85, 200, 133, .9),
    900: Color.fromRGBO(85, 200, 133, 1),
  };
  static const Map<int, Color> errorSwatch = {
    50: Color.fromRGBO(255, 99, 99, .1),
    100: Color.fromRGBO(255, 99, 99, .2),
    200: Color.fromRGBO(255, 99, 99, .3),
    300: Color.fromRGBO(255, 99, 99, .4),
    400: Color.fromRGBO(255, 99, 99, .5),
    500: Color.fromRGBO(255, 99, 99, .6),
    600: Color.fromRGBO(255, 99, 99, .7),
    700: Color.fromRGBO(255, 99, 99, .8),
    800: Color.fromRGBO(255, 99, 99, .9),
    900: Color.fromRGBO(255, 99, 99, 1),
  };
  static const Map<int, Color> defaultFontSwatch = {
    50: Color.fromRGBO(27, 27, 42, .1),
    100: Color.fromRGBO(27, 27, 42, .2),
    200: Color.fromRGBO(27, 27, 42, .3),
    300: Color.fromRGBO(27, 27, 42, .4),
    400: Color.fromRGBO(27, 27, 42, .5),
    500: Color.fromRGBO(27, 27, 42, .6),
    600: Color.fromRGBO(27, 27, 42, .7),
    700: Color.fromRGBO(27, 27, 42, .8),
    800: Color.fromRGBO(27, 27, 42, .9),
    900: Color.fromRGBO(27, 27, 42, 1),
  };
  static const Map<int, Color> defaultFontColorSwatch = {
    50: Color.fromRGBO(58, 58, 79, .1),
    100: Color.fromRGBO(58, 58, 79, .2),
    200: Color.fromRGBO(58, 58, 79, .3),
    300: Color.fromRGBO(58, 58, 79, .4),
    400: Color.fromRGBO(58, 58, 79, .5),
    500: Color.fromRGBO(58, 58, 79, .6),
    600: Color.fromRGBO(58, 58, 79, .7),
    700: Color.fromRGBO(58, 58, 79, .8),
    800: Color.fromRGBO(58, 58, 79, .9),
    900: Color.fromRGBO(58, 58, 79, 1),
  };
  static const Map<int, Color> shadowSwatch = {
    50: Color.fromRGBO(157, 157, 173, .1),
    100: Color.fromRGBO(157, 157, 173, .2),
    200: Color.fromRGBO(157, 157, 173, .3),
    300: Color.fromRGBO(157, 157, 173, .4),
    400: Color.fromRGBO(157, 157, 173, .5),
    500: Color.fromRGBO(157, 157, 173, .6),
    600: Color.fromRGBO(157, 157, 173, .7),
    700: Color.fromRGBO(157, 157, 173, .8),
    800: Color.fromRGBO(157, 157, 173, .9),
    900: Color.fromRGBO(157, 157, 173, 1),
  };
  static const Map<int, Color> containerSwatch = {
    50: Color.fromRGBO(206, 206, 214, .1),
    100: Color.fromRGBO(206, 206, 214, .2),
    200: Color.fromRGBO(206, 206, 214, .3),
    300: Color.fromRGBO(206, 206, 214, .4),
    400: Color.fromRGBO(206, 206, 214, .5),
    500: Color.fromRGBO(206, 206, 214, .6),
    600: Color.fromRGBO(206, 206, 214, .7),
    700: Color.fromRGBO(206, 206, 214, .8),
    800: Color.fromRGBO(206, 206, 214, .9),
    900: Color.fromRGBO(206, 206, 214, 1),
  };
  static const Map<int, Color> backgroundSwatch = {
    50: Color.fromRGBO(230, 230, 234, .1),
    100: Color.fromRGBO(230, 230, 234, .2),
    200: Color.fromRGBO(230, 230, 234, .3),
    300: Color.fromRGBO(230, 230, 234, .4),
    400: Color.fromRGBO(230, 230, 234, .5),
    500: Color.fromRGBO(230, 230, 234, .6),
    600: Color.fromRGBO(230, 230, 234, .7),
    700: Color.fromRGBO(230, 230, 234, .8),
    800: Color.fromRGBO(230, 230, 234, .9),
    900: Color.fromRGBO(230, 230, 234, 1),
  };
  static const Map<int, Color> whiteSwatch = {
    50: Color.fromRGBO(255, 255, 255, .1),
    100: Color.fromRGBO(255, 255, 255, .2),
    200: Color.fromRGBO(255, 255, 255, .3),
    300: Color.fromRGBO(255, 255, 255, .4),
    400: Color.fromRGBO(255, 255, 255, .5),
    500: Color.fromRGBO(255, 255, 255, .6),
    600: Color.fromRGBO(255, 255, 255, .7),
    700: Color.fromRGBO(255, 255, 255, .8),
    870: Color.fromRGBO(255, 255, 255, .87),
    800: Color.fromRGBO(255, 255, 255, .9),
    900: Color.fromRGBO(255, 255, 255, 1),
  };
}
