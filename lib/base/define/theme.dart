import 'package:flutter/material.dart';

import 'colors.dart';

AppColor colorsByTheme(context) => Theme.of(context).extension<AppColor>()!;

ThemeData getThemeData(
  BuildContext context, {
  bool isDarkTheme = false,
}) =>
    ThemeData(
      extensions: <AppColor>[
        AppColor(
          defaultFont: isDarkTheme ? AppColor.defaultFontDark : AppColor.defaultFontLight,
          icon: isDarkTheme ? AppColor.secondary : AppColor.white,
          iconBackground: isDarkTheme ? AppColor.background : AppColor.secondary,
          backgroundTheme: isDarkTheme ? AppColor.backgroundDark : AppColor.backgroundLight,
          backgroundCardHistoryWallet: isDarkTheme ? AppColor.backgroundLogo : AppColor.mainColor2Surface,
          backgroundAvatar: isDarkTheme ? AppColor.backgroundLogo : AppColor.mainColor2,
          hintTextColor: isDarkTheme ? AppColor.defaultFontContainer : AppColor.shadow,
          tabTitleColor: isDarkTheme ? AppColor.container : AppColor.defaultFontContainer,
          backgroundCardsChip: isDarkTheme ? AppColor.darkModeContainer : AppColor.white,
          expansionIcon: isDarkTheme ? AppColor.background : AppColor.shadow,
          selectableChipBg: isDarkTheme ? AppColor.backgroundDark : Colors.transparent,
        ),
      ],
      scaffoldBackgroundColor: isDarkTheme ? AppColor.backgroundDark : AppColor.backgroundLight,
      textTheme: Theme.of(context)
          .textTheme
          .copyWith(
            titleSmall: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 11),
          )
          .apply(
            fontFamily: 'dongle',
            bodyColor: isDarkTheme ? AppColor.defaultFontDark : AppColor.defaultFontLight,
            displayColor: isDarkTheme ? AppColor.defaultFontDark : AppColor.defaultFontLight,
          ),
      switchTheme: SwitchThemeData(
        thumbColor: MaterialStateProperty.all(isDarkTheme ? Colors.orange : Colors.purple),
      ),
      listTileTheme: ListTileThemeData(iconColor: isDarkTheme ? Colors.orange : Colors.purple),
      appBarTheme: AppBarTheme(
          backgroundColor: isDarkTheme ? AppColor.backgroundDark : AppColor.backgroundLight,
          iconTheme: IconThemeData(color: isDarkTheme ? Colors.white : Colors.black54)),
      useMaterial3: true,
      fontFamily: 'Dongle',
      unselectedWidgetColor: isDarkTheme ? AppColor.shadow : AppColor.backgroundDark,
    );
