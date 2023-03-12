import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';

enum AppToastMode { warning, confirm, error }

// ignore: must_be_immutable
class AppToast extends Flushbar {
  AppToast({
    Key? key,
    String? title,
    required Widget message,
    Duration? duration,
    Duration animationDuration = const Duration(milliseconds: 700),
    EdgeInsets padding = const EdgeInsets.all(12.0),
    double horizontalMargin = 16.0,
    double bottomOffset = 0,
    BorderRadius borderRadius = const BorderRadius.all(Radius.circular(12)),
    Color? backgroundColor,
    AppToastMode? mode = AppToastMode.confirm,
  }) : super(
          messageText: message,
          key: key,
          title: title,
          duration: duration,
          animationDuration: animationDuration,
          padding: padding,
          margin: EdgeInsets.fromLTRB(
            horizontalMargin,
            0,
            horizontalMargin,
            bottomOffset,
          ),
          borderRadius: borderRadius,
          backgroundColor: backgroundColor ?? const Color(0xFF4A4F63),
          icon: mode == null
              ? null
              : mode == AppToastMode.confirm
                  ? Assets.icon.whiteTick.svg(color: const Color(0xFF039855))
                  : mode == AppToastMode.error
                      ? Assets.icon.icErrorToast.svg()
                      : Assets.icon.whiteExclamation.svg(),
        );
}
