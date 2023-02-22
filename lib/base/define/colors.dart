import 'package:flutter/material.dart';

class AppColor {
  // Main Color 1
  static const mainColor1 = MaterialColor(0xFF3AAFFF, AppColorSwatch.mainColor1Swatch);
  static const mainColor1Container = MaterialColor(0xFF60BCFB, AppColorSwatch.mainColor1ContainerSwatch);
  static const mainColor1Surface = MaterialColor(0xFFB0DFFF, AppColorSwatch.mainColor1SurfaceSwatch);
  // Main Color 2
  static const mainColor2 = MaterialColor(0xFFFFD033, AppColorSwatch.mainColor2Swatch);
  static const mainColor2Container = MaterialColor(0xFFFFD958, AppColorSwatch.mainColor2ContainerSwatch);
  static const mainColor2Surface = MaterialColor(0xFFFFE384, AppColorSwatch.mainColor2SurfaceSwatch);
  // Auxiliary Colors
  static const secondary = MaterialColor(0xFFFF8811, AppColorSwatch.secondarySwatch);
  static const tertiary = MaterialColor(0xFFA55FEF, AppColorSwatch.tertiarySwatch);
  static const support = MaterialColor(0xFF55C885, AppColorSwatch.secondarySwatch);
  static const error = MaterialColor(0xFFFD6363, AppColorSwatch.errorSwatch);
  // Font Colors
  static const defaultFont = MaterialColor(0xFF1B1B2A, AppColorSwatch.defaultFontSwatch);
  static const defaultFontContainer = MaterialColor(0xFF3A3A4F, AppColorSwatch.defaultFontColorSwatch);
  // Generic Colors
  static const shadow = MaterialColor(0xFF9D9DAD, AppColorSwatch.shadowSwatch);
  static const container = MaterialColor(0xFFCECED6, AppColorSwatch.containerSwatch);
  static const background = MaterialColor(0xFFE6E6EA, AppColorSwatch.backgroundSwatch);
  static const white = MaterialColor(0xFFFFFFFF, AppColorSwatch.whiteSwatch);
}

const mainColor1 = Color(0xFF3AAFFF);
const mainColor2 = Color(0xFFFFD033);
const support = Color(0xFF55C885);
const secondary = Color(0xFFFF8811);
const mainColor2Surface = Color(0xFFFFE384);
const error = Color(0xFFFD6363);
const background = Color(0xFFE6E6EA);
const defaultFont = Color(0xFF1B1B2A);
const tertiary = Color(0xFFA55FEF);
const shadowColor = Color(0xFF9D9DAD);

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
    800: Color.fromRGBO(255, 255, 255, .9),
    900: Color.fromRGBO(255, 255, 255, 1),
  };
}
